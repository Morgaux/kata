--
-- haskell implementation of an alphabet cipher
--

import Control.Monad
import Data.Char
import Data.List
import Text.Read

-- Helper functions {{{
uncycle' :: (Eq a) => Int -> [a] -> [a]
uncycle' n x
       | n <= 0    = uncycle' 1 x
       | otherwise = if (take n x) == (take n $ drop n x) && ((drop 1 $ take (n + 1) x) == (drop 1 $ take (n + 1) $ drop n x))
                     then take n x
                     else uncycle' (n + 1) x

uncycle :: (Eq a) => [a] -> [a]
uncycle x  = uncycle' 1 x

shiftAlphabetByKey :: String -> [String]
shiftAlphabetByKey key = [ take (length letters) $ dropWhile (/= k) alphabet | k <- key ]
-- Helper functions }}}

-- Actual cipher logic {{{
letters = ['a' .. 'z']
alphabet = cycle letters

encode :: String -> String -> String
encode key msg = [ keyAlphabet !! (length $ takeWhile (/= msgLetter) alphabet) | (keyAlphabet, msgLetter) <- zip (cycle $ shiftAlphabetByKey key) msg ]

decode :: String -> String -> String
decode key msg = [ alphabet !! (length $ takeWhile (/= msgLetter) keyAlphabet) | (keyAlphabet, msgLetter) <- zip (cycle $ shiftAlphabetByKey key) msg ]

decipher :: String -> String -> String
decipher plain cipher =  uncycle [ head [ keyLetter | keyLetter <- letters, (encode [keyLetter] [plainLetter]) == [cipherLetter] ] | (plainLetter, cipherLetter) <- zip (cycle plain) (cycle cipher) ]
-- Actual cipher logic }}}

-- Main helper functions {{{
usage = "usage: enter lines to stdin in any of the following formats\n" ++
        "\tencode key=<keystring> message=<msgstring>\n" ++
        "\tdecode key=<keystring> message=<msgstring>\n" ++
        "\tdeciph plaintext=<cleartxtmsg> ciphertext=<ciphertxtmsg>"

getActionFromOptions :: [String] -> String
getActionFromOptions (x:xs) = x
getActionFromOptions []     = ""

getArgByNameFromOptions :: String -> [String] -> String
getArgByNameFromOptions "" _ = ""
getArgByNameFromOptions name (x:xs) = if (name ++ "=") `isPrefixOf` x
                                      then drop ((length name) + 1) x
                                      else getArgByNameFromOptions name xs
-- Main helper functions }}}

-- Main function {{{
main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ let options  = words [ toLower letter | letter <- line ]
                            action   = getActionFromOptions                 options
                            key      = getArgByNameFromOptions "key"        options
                            message  = getArgByNameFromOptions "message"    options
                            plain    = getArgByNameFromOptions "plaintext"  options
                            cipher   = getArgByNameFromOptions "ciphertext" options
                        in case action of
                                "encode"   -> encode key message
                                "decode"   -> decode key message
                                "decipher" -> decipher plain cipher
                                _          -> error $ "invalid input\n" ++ usage
-- Main function }}}


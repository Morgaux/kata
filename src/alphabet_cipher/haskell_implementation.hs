--
-- haskell implementation of an alphabet cipher
--

import Control.Monad
import Data.Char
import Data.List hiding (lookup)
import Data.Map hiding (drop, take)
import Data.Maybe
import Text.Read
import Prelude hiding (lookup)

letters = ['a' .. 'z']

keyMap = fromList [ (letter, fromList [ (key, value) | (key, value) <- zip letters $ take (length letters) $ dropWhile (/= letter) $ cycle letters ]) | letter <- letters ]


--
-- Helper functions for data look up and formatting
--

twoDimensionalLookup :: Char -> Char -> Map Char (Map Char Char) -> Char
twoDimensionalLookup xKey yKey map = fromMaybe '_' $ lookup yKey $ fromMaybe (fromList [('_', '_')]) $ lookup xKey map

findKeysByValue :: Char -> Map Char Char -> [Char]
findKeysByValue value map = [ key | key <- keys map, value == (fromMaybe '_' $ lookup key map) ]

findInnerKeysByValue :: Char -> Char -> Map Char (Map Char Char) -> [Char]
findInnerKeysByValue key value map = findKeysByValue value $ fromMaybe (fromList [('_', '_')]) $ lookup key map

uncycle' :: (Eq a) => Int -> [a] -> [a]
uncycle' n x
       | n <= 0    = uncycle' 1 x
       | otherwise = if all (== True) $ [ (take n x) == (take n $ drop n x) ] ++ [ ((drop i $ take (n + i) x) == (drop i $ take (n + i) $ drop n x)) | i <- [1]]
                     then take n x
                     else uncycle' (n + 1) x

uncycle :: (Eq a) => [a] -> [a]
uncycle x  = uncycle' 1 x


--
-- Actual cipher logic (encode, decode, decipher)
--

encode :: [Char] -> [Char] -> [Char]
encode key msg = [ twoDimensionalLookup keyLetter msgLetter keyMap | (keyLetter, msgLetter) <- zip (cycle key) msg ]

decode :: [Char] -> [Char] -> [Char]
decode key msg = [ head $ findInnerKeysByValue keyLetter msgLetter keyMap | (keyLetter, msgLetter) <- zip (cycle key) msg ]

decipher :: [Char] -> [Char] -> [Char]
decipher plain cipher =  uncycle [ head $ findInnerKeysByValue plainLetter cipherLetter keyMap | (plainLetter, cipherLetter) <- zip (cycle plain) (cycle cipher) ]


--
-- Main IO and helper functions
--

usage = "usage: enter lines to stdin in any of the following formats\n" ++
        "\tencode key=<keystring> message=<msgstring>\n" ++
        "\tdecode key=<keystring> message=<msgstring>\n" ++
        "\tdeciph plaintext=<cleartxtmsg> ciphertext=<ciphertxtmsg>"

getActionFromOptions :: [[Char]] -> [Char]
getActionFromOptions (x:xs) = x
getActionFromOptions []     = ""

getArgByNameFromOptions :: [Char] -> [[Char]] -> [Char]
getArgByNameFromOptions name (x:xs) = if (name ++ "=") `isPrefixOf` x
                                      then drop ((length name) + 1) x
                                      else getArgByNameFromOptions name xs
getArgByNameFromOptions name _ = ""

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


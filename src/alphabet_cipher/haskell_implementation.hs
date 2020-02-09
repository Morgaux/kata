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

keyMap = fromList [('a', fromList [('a', 'a'), ('b', 'b'), ('c', 'c'), ('d', 'd'), ('e', 'e'), ('f', 'f'), ('g', 'g'), ('h', 'h'), ('i', 'i'), ('j', 'j'), ('k', 'k'), ('l', 'l'), ('m', 'm'), ('n', 'n'), ('o', 'o'), ('p', 'p'), ('q', 'q'), ('r', 'r'), ('s', 's'), ('t', 't'), ('u', 'u'), ('v', 'v'), ('w', 'w'), ('x', 'x'), ('y', 'y'), ('z', 'z')]),
                   ('b', fromList [('a', 'b'), ('b', 'c'), ('c', 'd'), ('d', 'e'), ('e', 'f'), ('f', 'g'), ('g', 'h'), ('h', 'i'), ('i', 'j'), ('j', 'k'), ('k', 'l'), ('l', 'm'), ('m', 'n'), ('n', 'o'), ('o', 'p'), ('p', 'q'), ('q', 'r'), ('r', 's'), ('s', 't'), ('t', 'u'), ('u', 'v'), ('v', 'w'), ('w', 'x'), ('x', 'y'), ('y', 'z'), ('z', 'a')]),
                   ('c', fromList [('a', 'c'), ('b', 'd'), ('c', 'e'), ('d', 'f'), ('e', 'g'), ('f', 'h'), ('g', 'i'), ('h', 'j'), ('i', 'k'), ('j', 'l'), ('k', 'm'), ('l', 'n'), ('m', 'o'), ('n', 'p'), ('o', 'q'), ('p', 'r'), ('q', 's'), ('r', 't'), ('s', 'u'), ('t', 'v'), ('u', 'w'), ('v', 'x'), ('w', 'y'), ('x', 'z'), ('y', 'a'), ('z', 'b')]),
                   ('d', fromList [('a', 'd'), ('b', 'e'), ('c', 'f'), ('d', 'g'), ('e', 'h'), ('f', 'i'), ('g', 'j'), ('h', 'k'), ('i', 'l'), ('j', 'm'), ('k', 'n'), ('l', 'o'), ('m', 'p'), ('n', 'q'), ('o', 'r'), ('p', 's'), ('q', 't'), ('r', 'u'), ('s', 'v'), ('t', 'w'), ('u', 'x'), ('v', 'y'), ('w', 'z'), ('x', 'a'), ('y', 'b'), ('z', 'c')]),
                   ('e', fromList [('a', 'e'), ('b', 'f'), ('c', 'g'), ('d', 'h'), ('e', 'i'), ('f', 'j'), ('g', 'k'), ('h', 'l'), ('i', 'm'), ('j', 'n'), ('k', 'o'), ('l', 'p'), ('m', 'q'), ('n', 'r'), ('o', 's'), ('p', 't'), ('q', 'u'), ('r', 'v'), ('s', 'w'), ('t', 'x'), ('u', 'y'), ('v', 'z'), ('w', 'a'), ('x', 'b'), ('y', 'c'), ('z', 'd')]),
                   ('f', fromList [('a', 'f'), ('b', 'g'), ('c', 'h'), ('d', 'i'), ('e', 'j'), ('f', 'k'), ('g', 'l'), ('h', 'm'), ('i', 'n'), ('j', 'o'), ('k', 'p'), ('l', 'q'), ('m', 'r'), ('n', 's'), ('o', 't'), ('p', 'u'), ('q', 'v'), ('r', 'w'), ('s', 'x'), ('t', 'y'), ('u', 'z'), ('v', 'a'), ('w', 'b'), ('x', 'c'), ('y', 'd'), ('z', 'e')]),
                   ('g', fromList [('a', 'g'), ('b', 'h'), ('c', 'i'), ('d', 'j'), ('e', 'k'), ('f', 'l'), ('g', 'm'), ('h', 'n'), ('i', 'o'), ('j', 'p'), ('k', 'q'), ('l', 'r'), ('m', 's'), ('n', 't'), ('o', 'u'), ('p', 'v'), ('q', 'w'), ('r', 'x'), ('s', 'y'), ('t', 'z'), ('u', 'a'), ('v', 'b'), ('w', 'c'), ('x', 'd'), ('y', 'e'), ('z', 'f')]),
                   ('h', fromList [('a', 'h'), ('b', 'i'), ('c', 'j'), ('d', 'k'), ('e', 'l'), ('f', 'm'), ('g', 'n'), ('h', 'o'), ('i', 'p'), ('j', 'q'), ('k', 'r'), ('l', 's'), ('m', 't'), ('n', 'u'), ('o', 'v'), ('p', 'w'), ('q', 'x'), ('r', 'y'), ('s', 'z'), ('t', 'a'), ('u', 'b'), ('v', 'c'), ('w', 'd'), ('x', 'e'), ('y', 'f'), ('z', 'g')]),
                   ('i', fromList [('a', 'i'), ('b', 'j'), ('c', 'k'), ('d', 'l'), ('e', 'm'), ('f', 'n'), ('g', 'o'), ('h', 'p'), ('i', 'q'), ('j', 'r'), ('k', 's'), ('l', 't'), ('m', 'u'), ('n', 'v'), ('o', 'w'), ('p', 'x'), ('q', 'y'), ('r', 'z'), ('s', 'a'), ('t', 'b'), ('u', 'c'), ('v', 'd'), ('w', 'e'), ('x', 'f'), ('y', 'g'), ('z', 'h')]),
                   ('j', fromList [('a', 'j'), ('b', 'k'), ('c', 'l'), ('d', 'm'), ('e', 'n'), ('f', 'o'), ('g', 'p'), ('h', 'q'), ('i', 'r'), ('j', 's'), ('k', 't'), ('l', 'u'), ('m', 'v'), ('n', 'w'), ('o', 'x'), ('p', 'y'), ('q', 'z'), ('r', 'a'), ('s', 'b'), ('t', 'c'), ('u', 'd'), ('v', 'e'), ('w', 'f'), ('x', 'g'), ('y', 'h'), ('z', 'i')]),
                   ('k', fromList [('a', 'k'), ('b', 'l'), ('c', 'm'), ('d', 'n'), ('e', 'o'), ('f', 'p'), ('g', 'q'), ('h', 'r'), ('i', 's'), ('j', 't'), ('k', 'u'), ('l', 'v'), ('m', 'w'), ('n', 'x'), ('o', 'y'), ('p', 'z'), ('q', 'a'), ('r', 'b'), ('s', 'c'), ('t', 'd'), ('u', 'e'), ('v', 'f'), ('w', 'g'), ('x', 'h'), ('y', 'i'), ('z', 'j')]),
                   ('l', fromList [('a', 'l'), ('b', 'm'), ('c', 'n'), ('d', 'o'), ('e', 'p'), ('f', 'q'), ('g', 'r'), ('h', 's'), ('i', 't'), ('j', 'u'), ('k', 'v'), ('l', 'w'), ('m', 'x'), ('n', 'y'), ('o', 'z'), ('p', 'a'), ('q', 'b'), ('r', 'c'), ('s', 'd'), ('t', 'e'), ('u', 'f'), ('v', 'g'), ('w', 'h'), ('x', 'i'), ('y', 'j'), ('z', 'k')]),
                   ('m', fromList [('a', 'm'), ('b', 'n'), ('c', 'o'), ('d', 'p'), ('e', 'q'), ('f', 'r'), ('g', 's'), ('h', 't'), ('i', 'u'), ('j', 'v'), ('k', 'w'), ('l', 'x'), ('m', 'y'), ('n', 'z'), ('o', 'a'), ('p', 'b'), ('q', 'c'), ('r', 'd'), ('s', 'e'), ('t', 'f'), ('u', 'g'), ('v', 'h'), ('w', 'i'), ('x', 'j'), ('y', 'k'), ('z', 'l')]),
                   ('n', fromList [('a', 'n'), ('b', 'o'), ('c', 'p'), ('d', 'q'), ('e', 'r'), ('f', 's'), ('g', 't'), ('h', 'u'), ('i', 'v'), ('j', 'w'), ('k', 'x'), ('l', 'y'), ('m', 'z'), ('n', 'a'), ('o', 'b'), ('p', 'c'), ('q', 'd'), ('r', 'e'), ('s', 'f'), ('t', 'g'), ('u', 'h'), ('v', 'i'), ('w', 'j'), ('x', 'k'), ('y', 'l'), ('z', 'm')]),
                   ('o', fromList [('a', 'o'), ('b', 'p'), ('c', 'q'), ('d', 'r'), ('e', 's'), ('f', 't'), ('g', 'u'), ('h', 'v'), ('i', 'w'), ('j', 'x'), ('k', 'y'), ('l', 'z'), ('m', 'a'), ('n', 'b'), ('o', 'c'), ('p', 'd'), ('q', 'e'), ('r', 'f'), ('s', 'g'), ('t', 'h'), ('u', 'i'), ('v', 'j'), ('w', 'k'), ('x', 'l'), ('y', 'm'), ('z', 'n')]),
                   ('p', fromList [('a', 'p'), ('b', 'q'), ('c', 'r'), ('d', 's'), ('e', 't'), ('f', 'u'), ('g', 'v'), ('h', 'w'), ('i', 'x'), ('j', 'y'), ('k', 'z'), ('l', 'a'), ('m', 'b'), ('n', 'c'), ('o', 'd'), ('p', 'e'), ('q', 'f'), ('r', 'g'), ('s', 'h'), ('t', 'i'), ('u', 'j'), ('v', 'k'), ('w', 'l'), ('x', 'm'), ('y', 'n'), ('z', 'o')]),
                   ('q', fromList [('a', 'q'), ('b', 'r'), ('c', 's'), ('d', 't'), ('e', 'u'), ('f', 'v'), ('g', 'w'), ('h', 'x'), ('i', 'y'), ('j', 'z'), ('k', 'a'), ('l', 'b'), ('m', 'c'), ('n', 'd'), ('o', 'e'), ('p', 'f'), ('q', 'g'), ('r', 'h'), ('s', 'i'), ('t', 'j'), ('u', 'k'), ('v', 'l'), ('w', 'm'), ('x', 'n'), ('y', 'o'), ('z', 'p')]),
                   ('r', fromList [('a', 'r'), ('b', 's'), ('c', 't'), ('d', 'u'), ('e', 'v'), ('f', 'w'), ('g', 'x'), ('h', 'y'), ('i', 'z'), ('j', 'a'), ('k', 'b'), ('l', 'c'), ('m', 'd'), ('n', 'e'), ('o', 'f'), ('p', 'g'), ('q', 'h'), ('r', 'i'), ('s', 'j'), ('t', 'k'), ('u', 'l'), ('v', 'm'), ('w', 'n'), ('x', 'o'), ('y', 'p'), ('z', 'q')]),
                   ('s', fromList [('a', 's'), ('b', 't'), ('c', 'u'), ('d', 'v'), ('e', 'w'), ('f', 'x'), ('g', 'y'), ('h', 'z'), ('i', 'a'), ('j', 'b'), ('k', 'c'), ('l', 'd'), ('m', 'e'), ('n', 'f'), ('o', 'g'), ('p', 'h'), ('q', 'i'), ('r', 'j'), ('s', 'k'), ('t', 'l'), ('u', 'm'), ('v', 'n'), ('w', 'o'), ('x', 'p'), ('y', 'q'), ('z', 'r')]),
                   ('t', fromList [('a', 't'), ('b', 'u'), ('c', 'v'), ('d', 'w'), ('e', 'x'), ('f', 'y'), ('g', 'z'), ('h', 'a'), ('i', 'b'), ('j', 'c'), ('k', 'd'), ('l', 'e'), ('m', 'f'), ('n', 'g'), ('o', 'h'), ('p', 'i'), ('q', 'j'), ('r', 'k'), ('s', 'l'), ('t', 'm'), ('u', 'n'), ('v', 'o'), ('w', 'p'), ('x', 'q'), ('y', 'r'), ('z', 's')]),
                   ('u', fromList [('a', 'u'), ('b', 'v'), ('c', 'w'), ('d', 'x'), ('e', 'y'), ('f', 'z'), ('g', 'a'), ('h', 'b'), ('i', 'c'), ('j', 'd'), ('k', 'e'), ('l', 'f'), ('m', 'g'), ('n', 'h'), ('o', 'i'), ('p', 'j'), ('q', 'k'), ('r', 'l'), ('s', 'm'), ('t', 'n'), ('u', 'o'), ('v', 'p'), ('w', 'q'), ('x', 'r'), ('y', 's'), ('z', 't')]),
                   ('v', fromList [('a', 'v'), ('b', 'w'), ('c', 'x'), ('d', 'y'), ('e', 'z'), ('f', 'a'), ('g', 'b'), ('h', 'c'), ('i', 'd'), ('j', 'e'), ('k', 'f'), ('l', 'g'), ('m', 'h'), ('n', 'i'), ('o', 'j'), ('p', 'k'), ('q', 'l'), ('r', 'm'), ('s', 'n'), ('t', 'o'), ('u', 'p'), ('v', 'q'), ('w', 'r'), ('x', 's'), ('y', 't'), ('z', 'u')]),
                   ('w', fromList [('a', 'w'), ('b', 'x'), ('c', 'y'), ('d', 'z'), ('e', 'a'), ('f', 'b'), ('g', 'c'), ('h', 'd'), ('i', 'e'), ('j', 'f'), ('k', 'g'), ('l', 'h'), ('m', 'i'), ('n', 'j'), ('o', 'k'), ('p', 'l'), ('q', 'm'), ('r', 'n'), ('s', 'o'), ('t', 'p'), ('u', 'q'), ('v', 'r'), ('w', 's'), ('x', 't'), ('y', 'u'), ('z', 'v')]),
                   ('x', fromList [('a', 'x'), ('b', 'y'), ('c', 'z'), ('d', 'a'), ('e', 'b'), ('f', 'c'), ('g', 'd'), ('h', 'e'), ('i', 'f'), ('j', 'g'), ('k', 'h'), ('l', 'i'), ('m', 'j'), ('n', 'k'), ('o', 'l'), ('p', 'm'), ('q', 'n'), ('r', 'o'), ('s', 'p'), ('t', 'q'), ('u', 'r'), ('v', 's'), ('w', 't'), ('x', 'u'), ('y', 'v'), ('z', 'w')]),
                   ('y', fromList [('a', 'y'), ('b', 'z'), ('c', 'a'), ('d', 'b'), ('e', 'c'), ('f', 'd'), ('g', 'e'), ('h', 'f'), ('i', 'g'), ('j', 'h'), ('k', 'i'), ('l', 'j'), ('m', 'k'), ('n', 'l'), ('o', 'm'), ('p', 'n'), ('q', 'o'), ('r', 'p'), ('s', 'q'), ('t', 'r'), ('u', 's'), ('v', 't'), ('w', 'u'), ('x', 'v'), ('y', 'w'), ('z', 'x')]),
                   ('z', fromList [('a', 'z'), ('b', 'a'), ('c', 'b'), ('d', 'c'), ('e', 'd'), ('f', 'e'), ('g', 'f'), ('h', 'g'), ('i', 'h'), ('j', 'i'), ('k', 'j'), ('l', 'k'), ('m', 'l'), ('n', 'm'), ('o', 'n'), ('p', 'o'), ('q', 'p'), ('r', 'q'), ('s', 'r'), ('t', 's'), ('u', 't'), ('v', 'u'), ('w', 'v'), ('x', 'w'), ('y', 'x'), ('z', 'y')])]


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
             putStrLn $ let options  = [ [ toLower letter | letter <- word ] | word <- words line ]
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


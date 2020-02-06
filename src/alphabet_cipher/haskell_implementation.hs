--
-- haskell implementation of an alphabet cipher
--

import qualified Data.Map as Map

keyMap = Map.fromList [("a", "abcdefghijklmnopqrstuvwxyz")
                      ,("b", "bcdefghijklmnopqrstuvwxyza")
                      ,("c", "cdefghijklmnopqrstuvwxyzab")
                      ,("d", "defghijklmnopqrstuvwxyzabc")
                      ,("e", "efghijklmnopqrstuvwxyzabcd")
                      ,("f", "fghijklmnopqrstuvwxyzabcde")
                      ,("g", "ghijklmnopqrstuvwxyzabcdef")
                      ,("h", "hijklmnopqrstuvwxyzabcdefg")
                      ,("i", "ijklmnopqrstuvwxyzabcdefgh")
                      ,("j", "jklmnopqrstuvwxyzabcdefghi")
                      ,("k", "klmnopqrstuvwxyzabcdefghij")
                      ,("l", "lmnopqrstuvwxyzabcdefghijk")
                      ,("m", "mnopqrstuvwxyzabcdefghijkl")
                      ,("n", "nopqrstuvwxyzabcdefghijklm")
                      ,("o", "opqrstuvwxyzabcdefghijklmn")
                      ,("p", "pqrstuvwxyzabcdefghijklmno")
                      ,("q", "qrstuvwxyzabcdefghijklmnop")
                      ,("r", "rstuvwxyzabcdefghijklmnopq")
                      ,("s", "stuvwxyzabcdefghijklmnopqr")
                      ,("t", "tuvwxyzabcdefghijklmnopqrs")
                      ,("u", "uvwxyzabcdefghijklmnopqrst")
                      ,("v", "vwxyzabcdefghijklmnopqrstu")
                      ,("w", "wxyzabcdefghijklmnopqrstuv")
                      ,("x", "xyzabcdefghijklmnopqrstuvw")
                      ,("y", "yzabcdefghijklmnopqrstuvwx")
                      ,("z", "zabcdefghijklmnopqrstuvwxy")]

encode key msg = msg

decode key msg = msg

decipher plain cipher = "key"

main :: IO ()
main = putStrLn "Hello World!"


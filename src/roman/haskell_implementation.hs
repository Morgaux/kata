import Data.Maybe
import Control.Monad
import Text.Read

roman :: Maybe Int -> [Char]
roman number
    | x >= 1000 = "M" ++ roman (Just (x - 1000))
    | x >=  100 = ([ "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM" ] !! (mod (div x 100) 10)) ++ roman (Just (x `mod` 100))
    | x >=   10 = ([ "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" ] !! (mod (div x  10) 10)) ++ roman (Just (x `mod`  10))
    | x >=    1 = ([ "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" ] !! (mod (div x   1) 10)) ++ roman (Just (x `mod`   1))
    | otherwise = ""
    where x = fromMaybe 0 number

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case roman $ (readMaybe line :: Maybe Int) of
                             ""      -> line
                             numeral -> numeral


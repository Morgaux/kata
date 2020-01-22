import Text.Read
import Control.Monad

zeroAsDefault :: Maybe Int -> Int
zeroAsDefault mx = case mx of
                        Nothing -> 0
                        Just x -> x

roman :: Int -> [Char]
roman x
    | x >= 1000 = "M" ++ roman (x - 1000)
    | x >=  100 = (case (x `div` 100) `mod` 10 of
                        1 -> "C"
                        2 -> "CC"
                        3 -> "CCC"
                        4 -> "CD"
                        5 -> "D"
                        6 -> "DC"
                        7 -> "DCC"
                        8 -> "CCM"
                        9 -> "CM") ++ roman (x `mod` 100)
    | x >=   10 = (case (x `div` 10) `mod` 10 of
                        1 -> "X"
                        2 -> "XX"
                        3 -> "XXX"
                        4 -> "XL"
                        5 -> "L"
                        6 -> "LX"
                        7 -> "LXX"
                        8 -> "XXC"
                        9 -> "XC") ++ roman (x `mod` 10)
    | x >=    1 = (case x of
                        1 -> "I"
                        2 -> "II"
                        3 -> "III"
                        4 -> "IV"
                        5 -> "V"
                        6 -> "VI"
                        7 -> "VII"
                        8 -> "IIX"
                        9 -> "IX")
    | otherwise = ""

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case zeroAsDefault $ (readMaybe line :: Maybe Int) of
                             0 -> line
                             x -> roman x


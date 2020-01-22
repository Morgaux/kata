import Text.Read
import Control.Monad

zeroAsDefault :: Maybe Int -> Int
zeroAsDefault mx = case mx of
                        Nothing -> 0
                        Just x -> x

roman :: Int -> [Char]
roman x
    | x >= 1000 = "M" ++ roman (x - 1000)
    | x >=  100 = ([ "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM" ] !! ((x `div` 100) `mod` 10)) ++ roman (x `mod` 100)
    | x >=   10 = ([ "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" ] !! ((x `div`  10) `mod` 10)) ++ roman (x `mod` 10)
    | x >=    1 =  [ "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" ] !! x
    | otherwise = ""

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case zeroAsDefault $ (readMaybe line :: Maybe Int) of
                             0 -> line
                             x -> roman x


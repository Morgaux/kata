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
    | otherwise = ""

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case zeroAsDefault $ (readMaybe line :: Maybe Int) of
                             0 -> line
                             x -> roman x


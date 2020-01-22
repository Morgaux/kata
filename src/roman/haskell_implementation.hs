import Text.Read

zeroAsDefault :: Maybe Int -> Int
zeroAsDefault mx = case mx of
                        Nothing -> 0
                        Just x -> x

main :: IO ()
main = do
       line <- getLine
       putStrLn $ show $ zeroAsDefault $ (readMaybe line :: Maybe Int)


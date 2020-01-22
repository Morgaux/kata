import Text.Read
import Control.Monad

zeroAsDefault :: Maybe Int -> Int
zeroAsDefault mx = case mx of
                        Nothing -> 0
                        Just x -> x

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case zeroAsDefault $ (readMaybe line :: Maybe Int) of
                             0 -> line
                             x -> show x


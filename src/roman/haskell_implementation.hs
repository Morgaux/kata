import Data.Maybe
import Control.Monad
import Text.Read

roman :: Maybe Int -> [Char]
roman number
    | x >= 1000 = "M" ++ roman (Just (x - 1000))
    | x >     0 = (
                      (case base of
                          100 -> [ "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM" ]
                          10  -> [ "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC" ]
                          _   -> [ "", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX" ]
                      ) !! (
                          (x `div` base) `mod` 10  -- index to search for
                      )
                  ) ++ roman (Just (x `mod` base)) -- recurs on remainder
    | otherwise = ""
    where x    = fromMaybe 0 number
          base =      if x >= 100 then 100
                 else if x >=  10 then  10
                 else                    1

main :: IO ()
main = do
       contents <- getContents
       forM_ (lines contents) $ \ line -> do
             putStrLn $ case roman $ (readMaybe line :: Maybe Int) of
                             ""      -> line
                             numeral -> numeral


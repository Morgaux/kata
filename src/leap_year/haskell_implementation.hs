--
-- Leap Year calculator
--

import Control.Monad
import Data.Maybe
import Text.Read

-- IsLeap function {{{
isLeap :: Int -> String
isLeap year = if (year `mod` 4 == 0) && (not (year `mod` 100 == 1))
                 then "true"
                 else "false"
-- IsLeap function }}}

-- Main function {{{
main :: IO ()
main = do contents <- getContents
          forM_ (lines contents) $ \ line -> do
              putStrLn $ isLeap $ fromMaybe 0 $ (readMaybe line :: Maybe Int)
-- Main function }}}



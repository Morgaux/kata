--
-- Leap Year calculator
--

import Control.Monad
import Data.Maybe
import Text.Read

-- Main function {{{
main :: IO ()
main = do contents <- getContents
          forM_ (lines contents) $ \ line -> do
              putStrLn $ show $ fromMaybe 0 $ (readMaybe line :: Maybe Int)
-- Main function }}}



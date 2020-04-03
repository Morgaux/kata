--
-- Leap Year calculator
--

import Control.Monad

-- Main function {{{
main :: IO ()
main = do contents <- getContents
          forM_ (lines contents) $ \ line -> do
              putStrLn line
-- Main function }}}



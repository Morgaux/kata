
fizzes              = cycle [ "", "", "Fizz" ]
buzzes              = cycle [ "", "", "", "", "Buzz" ]
fizzes_and_buzzes   = [ f ++ b | (f, b) <- zip fizzes buzzes ]
fizzbuzz            = [ if s == "" then show n else s | (n, s) <- zip [1..] fizzes_and_buzzes ]

main :: IO ()
main = putStrLn $ unlines $ take 100 fizzbuzz


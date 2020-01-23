
fizzes              = cycle [ "", "", "Fizz"         ]
buzzes              = cycle [ "", "", "", "", "Buzz" ]
fizzes_and_buzzes   = [ f ++ b | (f, b) <- zip fizzes buzzes ]
fizzbuzz            = [ max s $ show n | (n, s) <- zip [1..] fizzes_and_buzzes ]

main :: IO ()
main = putStrLn $ init $ unlines $ take 100 fizzbuzz


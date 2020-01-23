
fizzes   = cycle [ "", "", "Fizz"         ]
buzzes   = cycle [ "", "", "", "", "Buzz" ]
strings  = zipWith (++) fizzes buzzes
fizzbuzz = [ max s $ show n | (n, s) <- zip [1..] strings ]

main :: IO ()
main = putStrLn $ init $ unlines $ take 100 fizzbuzz


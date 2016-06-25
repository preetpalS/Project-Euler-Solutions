
isMultipleOfThreeOrFive x = ((x `mod` 3 == 0) || (x `mod` 5 == 0))

main = print $ sum $ filter isMultipleOfThreeOrFive $ take 999 [ 1, 2 .. ]

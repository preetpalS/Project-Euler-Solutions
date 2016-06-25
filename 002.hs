
fibonacci 1 = 1
fibonacci 2 = 2
fibonacci n = fibonacci(n - 1) + fibonacci(n - 2)

fibonacciSequence = map fibonacci [ 1, 2 .. ]

main = print $ sum $ filter even $ takeWhile (<= 4000000) fibonacciSequence 

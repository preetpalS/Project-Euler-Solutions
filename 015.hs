
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n - 1)

{- Explanation
In order to reach the bottom right corner of the 20x20 grid from the top left corner,
20 right moves and 20 down moves must be taken. Each path can be considered to be a
linear arrangement of the 40 possible moves which allows us to give a total for the
number of possible paths: (40! / ((20!) * (20!)))
-}

main = print $ (factorial(40) `quot` (factorial(20) * factorial(20)))

{- Command line log:
C:\ProjectEulerSolutions>ghc 015.hs
[1 of 1] Compiling Main             ( 015.hs, 015.o )
Linking 015.exe ...

C:\ProjectEulerSolutions>015.exe
137846528820

C:\Users\Preetpal\Projects\Puzzles\ProjectEulerSolutions>ghc -v
Glasgow Haskell Compiler, Version 8.0.1, stage 2 booted by GHC version 7.10.2
Using binary package database: C:\Program Files\Haskell Platform\8.0.1\lib\package.conf.d\package.cache
loading package database C:\Program Files\Haskell Platform\8.0.1\lib\package.conf.d
wired-in package ghc-prim mapped to ghc-prim-0.5.0.0
wired-in package integer-gmp mapped to integer-gmp-1.0.0.1
wired-in package base mapped to base-4.9.0.0
wired-in package rts mapped to rts
wired-in package template-haskell mapped to template-haskell-2.11.0.0
wired-in package ghc mapped to ghc-8.0.1
wired-in package dph-seq not found.
wired-in package dph-par not found.
Hsc static flags:
*** Deleting temp files:
Deleting:
*** Deleting temp dirs:
Deleting:
ghc: no input files
Usage: For basic information, try the `--help' option.

-}

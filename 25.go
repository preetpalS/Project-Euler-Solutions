package main

import (
	"fmt"
	"math/big"
	"unicode/utf8"
)

func main() {
	count := 3
	fib1 := big.NewInt(1)
	fib2 := big.NewInt(1)
	fib3 := (&big.Int{}).Add(fib1, fib2)

	// Exploits the fact that digits are represented as single Runes in UTF8 strings
	for utf8.RuneCountInString(fib3.String()) < 1000 {
		count = count + 1
		fib1 = fib2
		fib2 = fib3
		fib3 = (&big.Int{}).Add(fib1, fib2)
	}

	// Solution: 4782
	fmt.Println(count)
}

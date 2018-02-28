package main

import (
	"fmt"
	"strconv"
)

// Does not consider combining characters (therefore naiveButSufficientReverse("bròwn") returns "nẁorb" instead of "nwòrb")
func naiveButSufficientReverse(s string) string {
	runes := []rune(s)
	for incrementingCounter, decrementingCounter := 0, len(runes)-1; incrementingCounter < len(runes)/2; incrementingCounter, decrementingCounter = incrementingCounter+1, decrementingCounter-1 {
		runes[incrementingCounter], runes[decrementingCounter] = runes[decrementingCounter], runes[incrementingCounter]
	}
	return string(runes)
}

func main() {
	sum := int64(0)
	for i := int64(1); i < 1000000; i++ {
		if naiveButSufficientReverse(strconv.FormatInt(i, 10)) == strconv.FormatInt(i, 10) {
			if (naiveButSufficientReverse(strconv.FormatInt(i, 2))) == strconv.FormatInt(i, 2) {
				sum += i
			}
		}
	}
	// Solution: 872187
	fmt.Println(sum)
}

/*
$ go version
go version go1.9.2 freebsd/amd64

$ go run 036.go
872187

*/

/*
// Problem description (from projecteuler.net (https://projecteuler.net/problem=36); please visit the site and donate to it if you find it useful)
Double-base palindromes
Problem 36
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/

package main

import (
	"errors"
	"fmt"
	"math/big"
)

func factorial(n int64) (*big.Int, error) {
	if n < 0 {
		return nil, errors.New("Must provide argument `n` >= 0 for `factorial(n int64) (*big.Int, error)`")
	}

	toReturn := big.NewInt(1)

	for i := int64(1); i <= n; i++ {
		toReturn.Mul(toReturn, big.NewInt(i))
	}

	return toReturn, nil
}

func main() {
	total := 0
	res, err := factorial(100)

	if err != nil {
		panic(fmt.Sprintf("Failed to compute 100!: %s", err))
	}

	for _, elem := range res.String() {
		switch elem {
		case '1':
			total = total + 1
		case '2':
			total = total + 2
		case '3':
			total = total + 3
		case '4':
			total = total + 4
		case '5':
			total = total + 5
		case '6':
			total = total + 6
		case '7':
			total = total + 7
		case '8':
			total = total + 8
		case '9':
			total = total + 9
		}
	}

	// Solution: 648
	fmt.Println(total)
}


func nthFibonacciSequenceTerm(secondLastTerm: Int, _ lastTerm: Int) -> (lastTerm: Int, nthTerm: Int) {
    return (lastTerm, secondLastTerm + lastTerm)
}

var fib1 = 1
var fib2 = 2
var total = fib2

while (fib2 <= 4000000) {
    let nextFibonacciSequenceTerms = nthFibonacciSequenceTerm(fib1, fib2)
    fib1 = nextFibonacciSequenceTerms.lastTerm
    fib2 = nextFibonacciSequenceTerms.nthTerm

    if (fib2 % 2 == 0) {
        total += fib2
    }
}

// Solution: 4613732
print(total)

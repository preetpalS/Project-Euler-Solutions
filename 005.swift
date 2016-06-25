
// 20: 2, 2, 5
// 18: 2, 3, 3
// 16: 2, 2, 2, 2
// 15: 3, 5,
// 14: 2, 7
// 12: 2, 2, 3
// Primes: 2, 3, 5, 7, 11, 13, 17, 19
let knownPrimeFactorsOfNumbersBetween1And20 = [2, 2, 2, 2, 3, 3, 5, 7, 11, 13, 17, 19]
let stepSize = 20
var possibleSolution = knownPrimeFactorsOfNumbersBetween1And20.reduce(1) { $0 * $1 }

while true {
    var isSolution = true
    for x in 1..<21 {
        if possibleSolution % x != 0 {
            isSolution = false
        }
    }

    if isSolution {
        break
    } else {
        possibleSolution += stepSize
    }
}

// Solution: 232792560
print(possibleSolution)

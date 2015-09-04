
func isPrime(n: Int64) -> Bool {
    if n < 2 {
        return false
    } else if n < 4 {
        return true
    } else if n % 2 == 0 {
        return false
    } else {
        var x:Int64 = 3
        while n > x * x {
            if n % x == 0 {
                return false
            }
            x += 2
        }
    }

    return true
}

// odd number of interest
var numberOfInterest:Int64 = 600851475143
var possiblePrime:Int64 = 1

while numberOfInterest != 1 {
    possiblePrime += 2

    if isPrime(possiblePrime) {
        while numberOfInterest % possiblePrime == 0 {
            numberOfInterest = numberOfInterest / possiblePrime
        }
    }
}

// Solution: 6857
println(possiblePrime)



func isPalindrome(possiblePalindrome: String) -> Bool {
    return possiblePalindrome == String(possiblePalindrome.characters.reverse())
}

var bestSoFar = 0

for x in 100..<1000 {
    for y in x..<1000 {
        let xy = x * y
        if xy > bestSoFar && isPalindrome(String(xy)) {
            bestSoFar = xy
        }
    }
}

// Solution: 906609
print(bestSoFar)


let nthDigitsOfInterestIndices = [
    1,
    10,
    100,
    1000,
    10000,
    100000,
    1000000
]

let nthDigitsOfInterest = []

let nthDigitsOfInterestCurrentIndex = 0;
let i = 1
let count = 0
while (nthDigitsOfInterest.length !==
       nthDigitsOfInterestIndices.length) {

    let increment = i.toString().length;

    if ((count + increment) >=
        nthDigitsOfInterestIndices[nthDigitsOfInterestCurrentIndex]) {
        let iIndex = nthDigitsOfInterestIndices[nthDigitsOfInterestCurrentIndex] - count - 1;
        nthDigitsOfInterestCurrentIndex = nthDigitsOfInterestCurrentIndex + 1;
        nthDigitsOfInterest.push(parseInt(i.toString()[iIndex]));
    }

    count = count + increment;
    i = i + 1;
}

console.log(nthDigitsOfInterest.reduce((a, b) => { return a * b; }));

/*
C:\Users\me\folder\Project-Euler-Solutions>node 040.js
210

C:\Users\me\folder\Project-Euler-Solutions>node -v
v10.2.1

C:\Users\me\folder\Project-Euler-Solutions>
 */

/*
// Problem description (from projecteuler.net (https://projecteuler.net/problem=40); please visit the site and donate to it if you find it useful)
Champernowne's constant
Problem 40 

An irrational decimal fraction is created by concatenating the positive integers:
0.123456789101112131415161718192021...
It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
 */

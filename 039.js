
let bestSolutionSoFar = { p: NaN, numberOfSolutions: 0 };

let isRightTrianglePredicate = (a, b, hypotenuse) => {
    let a2b2 = (a * a) + (b * b);
    let hypotenuse2 = (hypotenuse * hypotenuse);
    if (a2b2 === hypotenuse2)
        return 0;
    else if (a2b2 > hypotenuse2)
        return -1;
    else
        return 1;
}

if (!((isRightTrianglePredicate(20, 48, 52) === 0) &&
      (isRightTrianglePredicate(24, 45, 51) === 0) &&
      (isRightTrianglePredicate(30, 40, 50) === 0)))
    throw new Error("Failed to detect right triangles.");

let numberOfRightTrianglesWithIntegralLengthSidesWithPerimeter = (perimeter) => {
    let numberOfSolutions = 0;
    let nonHypotenuseUpperBound = perimeter / 2;

    outerLoop:
    for (let a = 1; a < nonHypotenuseUpperBound; a++) {
        innerLoop:
        for (let b = a; b < nonHypotenuseUpperBound; b++) {
            let ab = a + b;
            if (ab >= perimeter) break innerLoop;
            let c = perimeter - a - b;
            if (a > c) break outerLoop;
            if (b > c) break innerLoop;
            let res = isRightTrianglePredicate(a, b, c);
            if (res === 0) {
                numberOfSolutions = numberOfSolutions + 1;
            } else if (res < -1) {
                break outerLoop;
            }
        }
    }

    //console.log(`${perimeter}: ${numberOfSolutions}`)
    return numberOfSolutions;
}

if (numberOfRightTrianglesWithIntegralLengthSidesWithPerimeter(120) !== 3)
    throw new Error("Failed to find correct number of integral-sided right triangles with perimeter equal to 120.");

if (3 !== numberOfRightTrianglesWithIntegralLengthSidesWithPerimeter(120))
    throw new Error("Failed to detect number of solutions.");

for (let p = 3; p <= 1000; p++) {
    let numberOfSolutions = numberOfRightTrianglesWithIntegralLengthSidesWithPerimeter(p);
    if (numberOfSolutions > bestSolutionSoFar.numberOfSolutions) {
        bestSolutionSoFar.p = p;
        bestSolutionSoFar.numberOfSolutions = numberOfSolutions;
    }
}

console.log(`Solution (p = ${bestSolutionSoFar.p}): ${bestSolutionSoFar.numberOfSolutions}`)

/*
C:\Users\me\folder\Project-Euler-Solutions>node 039.js
Solution (p = 840): 8

C:\Users\me\folder\Project-Euler-Solutions>node -v
v10.2.1

C:\Users\me\folder\Project-Euler-Solutions>
 */

/*
// Problem description (from projecteuler.net (https://projecteuler.net/problem=39); please visit the site and donate to it if you find it useful)
Integer right triangles
Problem 39 

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
{20,48,52}, {24,45,51}, {30,40,50}
For which value of p ≤ 1000, is the number of solutions maximised?
 */

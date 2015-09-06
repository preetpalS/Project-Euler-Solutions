
using System;
using System.Collections.Generic;
using System.Linq;

namespace ProjectEuler {
    class Program {
        public static void Main(string[] args) {
            int sumOfNaturalNumbers = Enumerable.Range(1, 100).Aggregate(0, (acc, x) => acc + x);
            int squareOfSum = sumOfNaturalNumbers * sumOfNaturalNumbers;

            int sumOfSquares = Enumerable.Range(1, 100).Select(x => x * x).Aggregate(0, (acc, x) => acc + x);

            int solution = squareOfSum - sumOfSquares;

            // Solution: 25164150
            Console.WriteLine(solution);
        }
    }
}


def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  (3..(Math.sqrt n).ceil).each do |i|
    return false if n % i == 0
  end
  true
end

class QuadraticFormula
  def initialize(a, b)
    @a = a
    @b = b
  end

  def call(n)
    (n ** 2) + (@a * n) + @b
  end
end

max_number_of_primes = 0
solution = 0
((-1000)..1000).each do |a|
  ((-1000)..1000).each do |b|
    func = QuadraticFormula.new a, b

    n = 0
    loop do
      break unless prime?(func.call(n))
      n = n + 1
    end

    if n > max_number_of_primes
      puts "Coefficients { a: #{a}, b: #{b} } produce #{n} consecutive primes with quadratic formula."
      max_number_of_primes = n
      solution = a * b
    end
  end
end

puts solution

=begin
C:\ProjectEulerSolutions>ruby 027.rb
Coefficients { a: -1000, b: 2 } produce 1 consecutive primes with quadratic formula.
Coefficients { a: -996, b: 997 } produce 2 consecutive primes with quadratic formula.
Coefficients { a: -499, b: 997 } produce 3 consecutive primes with quadratic formula.
Coefficients { a: -325, b: 977 } produce 4 consecutive primes with quadratic formula.
Coefficients { a: -245, b: 977 } produce 5 consecutive primes with quadratic formula.
Coefficients { a: -197, b: 983 } produce 6 consecutive primes with quadratic formula.
Coefficients { a: -163, b: 983 } produce 7 consecutive primes with quadratic formula.
Coefficients { a: -131, b: 941 } produce 8 consecutive primes with quadratic formula.
Coefficients { a: -121, b: 947 } produce 9 consecutive primes with quadratic formula.
Coefficients { a: -105, b: 967 } produce 11 consecutive primes with quadratic formula.
Coefficients { a: -61, b: 971 } produce 71 consecutive primes with quadratic formula.
-59231

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

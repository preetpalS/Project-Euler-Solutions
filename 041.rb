
require 'set'

PRIMES = []
PRIMES_RELEVANCY_CUTOFF = (Math.sqrt 987_654_321).ceil

def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  PRIMES.each do |prime|
    if n % prime == 0
      return false
    end
  end
  true
end

primes = Enumerator.new do|yielder|
  yielder.yield 2

  to_test = 3
  loop do
    if prime?(to_test)
      PRIMES.push to_test unless (to_test > PRIMES_RELEVANCY_CUTOFF)
      yielder.yield to_test
    end

    to_test += 2
  end
end

def pandigital?(n)
  ar = n.to_s.split('').map(&:to_i).sort
  (0..(ar.length - 1)).each do |i|
    return false unless ar[i] == (1 + i)
  end
  true
end

fail unless pandigital?(987_654_321)

def pandigital_prime?(n)
  prime?(n) && pandigital?(n)
end

fail unless pandigital_prime?(2143)

# build cache
primes.take_while { |x| x < PRIMES_RELEVANCY_CUTOFF }

(9.downto(1)).each do |outer|
  (1..outer).to_a.permutation.sort.reverse.each do |permutation|
    temp = permutation.map(&:to_s).reduce(:+).to_i
    if pandigital_prime?(temp)
      # 7652413
      pp temp
      exit 0
    end
  end
end


# largest_known_pandigital_prime = 2143
# (987_654_321).downto(1).each do |i|
#   puts i
#   if pandigital_prime?(i)
#     pp i
#     exit
#   end
# end

=begin

$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-freebsd11.1]

$ ruby 041.rb
7652413

=end


=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=41); please visit the site and donate to it if you find it useful)
Pandigital prime
Problem 41
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
What is the largest n-digit pandigital prime that exists?
=end

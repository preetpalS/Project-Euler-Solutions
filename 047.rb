# coding: utf-8
# frozen_string_literal: true

def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  (3..(Math.sqrt n).ceil).each do |i|
    return false if n % i == 0
  end
  true
end

$primes = []
primes_enumerator = Enumerator.new do |yielder|
  yielder.yield 2

  to_test = 3
  loop do
    yielder.yield to_test if prime?(to_test)

    to_test += 2
  end
end

primes_enumerator.each do |prime|
  $primes.push prime
  break if prime > 1_000_000
end

def find_distinct_prime_factors(n)
  fail if n > 1_000_000
  distinct_prime_factors = []
  $primes.each do |prime|
    while n % prime == 0
      n /= prime
      distinct_prime_factors.push(prime) unless distinct_prime_factors.include?(prime)
    end
    break if n == 1
  end
  distinct_prime_factors
end

fail unless find_distinct_prime_factors(14) == [2, 7]
fail unless find_distinct_prime_factors(15) == [3, 5]
fail unless find_distinct_prime_factors(644) == [2, 7, 23]
fail unless find_distinct_prime_factors(645) == [3, 5, 43]
fail unless find_distinct_prime_factors(646) == [2, 17, 19]

possible_solution = nil
consecutive_count_of_integers_with_four_distinct_prime_factors_each = 0
(1...).each do |i|
  if find_distinct_prime_factors(i).length == 4
    consecutive_count_of_integers_with_four_distinct_prime_factors_each += 1
    if consecutive_count_of_integers_with_four_distinct_prime_factors_each == 1
      possible_solution = i
    elsif consecutive_count_of_integers_with_four_distinct_prime_factors_each == 4
      break
    end
  else
    consecutive_count_of_integers_with_four_distinct_prime_factors_each = 0
    possible_solution = nil
  end
end

puts possible_solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 047.rb
134043

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=47); please visit the site and donate to it if you find it useful)
Distinct primes factors

Problem 47
The first two consecutive numbers to have two distinct prime factors are:
14 = 2 × 7
15 = 3 × 5
The first three consecutive numbers to have three distinct prime factors are:
644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.
Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
=end

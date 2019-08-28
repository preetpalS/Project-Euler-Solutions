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

def permutation_check(a, b, c)
  a_arr = a.to_s.split('').sort
  b_arr = b.to_s.split('').sort
  c_arr = c.to_s.split('').sort

  a_arr == b_arr && b_arr == c_arr
end

fail unless permutation_check(1487, 4817, 8147)

solution = nil
(1000..(9999 - (3330 * 2))).each do |first_term|
  next if [1487, 4817, 8147].include?(first_term)
  next unless prime?(first_term)
  second_term = first_term + 3330
  next unless prime?(second_term)
  third_term = second_term + 3330
  next unless prime?(third_term)
  next unless permutation_check(first_term, second_term, third_term)
  solution = first_term.to_s + second_term.to_s + third_term.to_s
  break if solution
end

# fail if solution.nil?
puts solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 049.rb
296962999629

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=49); please visit the site and donate to it if you find it useful)
Prime permutations

Problem 49
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
What 12-digit number do you form by concatenating the three terms in this sequence?
=end

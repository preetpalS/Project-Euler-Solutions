# coding: utf-8
# frozen_string_literal: true

def permutation_check(a, b, c, d, e, f)
  a_arr = a.to_s.split('').sort
  b_arr = b.to_s.split('').sort
  c_arr = c.to_s.split('').sort
  d_arr = d.to_s.split('').sort
  e_arr = e.to_s.split('').sort
  f_arr = f.to_s.split('').sort

  a_arr == b_arr && c_arr == d_arr && e_arr == f_arr && b_arr == c_arr && d_arr == e_arr
end

# fail unless permutation_check(1487, 4817, 8147)

solution = nil
(1...).each do |i|
  next unless permutation_check(i, 2 * i, 3 * i, 4 * i, 5 * i, 6 * i)
  solution = i
  break if solution
end

# fail if solution.nil?
puts solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 052.rb
142857

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=52); please visit the site and donate to it if you find it useful)
Permuted multiples

Problem 52
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
=end

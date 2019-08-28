# coding: utf-8
# frozen_string_literal: true

def digital_sum(n)
  n.to_s.split('').map(&:to_i).reduce(:+)
end

fail unless 2 ** 3 == 8
fail unless digital_sum(100 ** 100) == 1

solution = 0
(1..99).each do |a|
  (1..99).each do |b|
    tmp = digital_sum(a ** b)
    if tmp > solution
      solution = tmp
    end
  end
end

# fail if solution.nil?
puts solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 056.rb
970

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=56); please visit the site and donate to it if you find it useful)
Powerful digit sum

Problem 56
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
=end

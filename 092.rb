# coding: utf-8
# frozen_string_literal: true

$cache = {}

def sum_of_square_digits(n)
  n.to_s.split('').map(&:to_i).map { |x| x * x }.reduce(:+)
end

def number_chain_terminator(start)
  tmp = start
  loop do
    if $cache[tmp]
      return $cache[tmp]
    end

    if tmp == 89
      return 89
      break
    elsif tmp == 1
      return 1
      break
    end

    tmp = sum_of_square_digits(tmp)
  end
end
fail if sum_of_square_digits(9_999_999) != 567

(1..567).each do |i|
  $cache[i] = number_chain_terminator(i)
end

count_of_chains_ending_in_89 = 0
(1...10_000_000).each do |i|
  loop do
    tmp = number_chain_terminator(i)
    if tmp == 89
      count_of_chains_ending_in_89 += 1
      break
    elsif tmp == 1
      break
    end
  end
end

puts count_of_chains_ending_in_89

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 092.rb
8581146

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=92); please visit the site and donate to it if you find it useful)
Square digit chains

Problem 92
A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
For example,
44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
How many starting numbers below ten million will arrive at 89?
=end

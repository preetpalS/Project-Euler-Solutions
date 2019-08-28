# coding: utf-8
# frozen_string_literal: true

puts (28_433 * (2 ** 7_830_457) + 1).to_s[-10..-1]

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 097.rb
8739992577

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=97); please visit the site and donate to it if you find it useful)
Large non-Mersenne prime

Problem 97
The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form 26972593−1; it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form 2p−1, have been found which contain more digits.
However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433×27830457+1.
Find the last ten digits of this prime number.
=end

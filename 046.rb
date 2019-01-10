# coding: utf-8

require 'set'

PRIMES = [2]

def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  PRIMES.each do |prime|
    return true if (prime * prime) > n
    if n % prime == 0
      return false
    end
  end
  true
end

class Primes
  include Enumerable

  def each
    yield 2

    to_test = 3
    loop do
      if prime?(to_test)
        if to_test > PRIMES[-1]
          PRIMES.push to_test
        end
        yield to_test
      end

      to_test += 2
    end
  end
end

primes = Primes.new
primes.each { |n| break unless n <= 35 }

# Composite Number: A positive number that is not a prime

number_of_interest = nil
catch(:break_outer_loop) do
  # Endless ranges are a feature introduced in Ruby 2.6
  (35..).step(2).each do |odd|
    primes.each { |n| break unless n <= odd } if PRIMES[-1] < odd

    if PRIMES.bsearch { |prime| odd <=> prime }
      next
    end

    catch(:break_middle_loop) do
      (0..).each do |i|
        prime = PRIMES[i]
        if prime > odd
          number_of_interest = odd
          throw :break_outer_loop
        end

        catch(:break_inner_loop) do
          (1..).each_with_index do |i, index|
            sum = prime + (2 * (i * i))

            if sum > odd
              throw :break_inner_loop
            elsif sum == odd
              throw :break_middle_loop
            else
              next
            end
          end
        end
      end
    end
  end
end

puts number_of_interest

=begin
C:\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Project-Euler-Solutions>ruby 046.rb
5777

C:\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=46); please visit the site and donate to it if you find it useful)
Goldbach's other conjecture
Problem 46

It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
9 = 7 + 2 × 1^2
15 = 7 + 2 × 2^2
21 = 3 + 2 × 3^2
25 = 7 + 2 × 3^2
27 = 19 + 2 × 2^2
33 = 31 + 2 × 1^2
It turns out that the conjecture was false.
What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
=end

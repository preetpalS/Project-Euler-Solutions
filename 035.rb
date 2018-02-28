
require 'set'

def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  (3..(Math.sqrt n).ceil).each do |i|
    return false if n % i == 0
  end
  true
end

primes = Enumerator.new do|yielder|
  yielder.yield 2

  to_test = 3
  loop do
    yielder.yield to_test if prime?(to_test)

    to_test += 2
  end
end


primes_below_one_million = Set.new(primes.take_while { |i| i < 1_000_000 })
circular_primes = Set.new

primes_below_one_million.each do |prime|
  next if circular_primes.include?(prime)
  number_of_possible_rotations = prime.to_s.length - 1

  if number_of_possible_rotations.zero?
    circular_primes.add prime
  else
    circular_prime_check = true
    (1..number_of_possible_rotations).each do |i|
      rotated_number = prime.to_s.split('').rotate(i).reduce(:+).to_i
      unless primes_below_one_million.include?(rotated_number)
        circular_prime_check = false
      end
    end

    if circular_prime_check
      (0..number_of_possible_rotations).each { |i| circular_primes.add prime.to_s.split('').rotate(i).reduce(:+).to_i }
    end
  end
end

# 55
pp circular_primes.length

=begin
$ ruby 035.rb
55

$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-freebsd11.1]
=end


=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=35); please visit the site and donate to it if you find it useful)
Circular primes
Problem 35
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
How many circular primes are there below one million?
=end

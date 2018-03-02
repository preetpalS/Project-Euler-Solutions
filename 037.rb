
require 'set'

def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  (3..(Math.sqrt n).ceil).each do |i|
    if n % i == 0
      return false
    end
  end
  true
end

def truncatable_prime?(n)
  return false unless prime?(n)
  return false if n < 11

  is_truncatable_prime = true
  temp = n.to_s.split('')
  (0...(temp.length - 1)).each do |i|
    x = temp[0..i].reduce(:+).to_i
    y = temp.reverse[0..i].reverse.reduce(:+).to_i
    return false if !prime?(x) || !prime?(y)
  end
  true
end

fail unless truncatable_prime?(3797)

primes = Enumerator.new do|yielder|
  yielder.yield 2

  to_test = 3
  loop do
    yielder.yield to_test if prime?(to_test)

    to_test += 2
  end
end

truncatable_primes = Enumerator.new do |yielder|
  count = 0
  filter = 10000
  primes.each do |prime|
    break if count == 11

    if truncatable_prime?(prime)
      count += 1
      yielder.yield prime
    end
  end
end

# 748317
pp truncatable_primes.reduce(:+)

=begin
$ ruby 037.rb
748317

$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-freebsd11.1]
=end


=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=37); please visit the site and donate to it if you find it useful)
Truncatable primes
Problem 37
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
=end

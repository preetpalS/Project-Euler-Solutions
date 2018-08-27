
DIGITS = (0..9).to_a

def property_satisfied?(digits_array)
  return false if digits_array[0].zero?
  d234 = digits_array[1..3].map(&:to_s).reduce(:+).to_i
  d345 = digits_array[2..4].map(&:to_s).reduce(:+).to_i
  d456 = digits_array[3..5].map(&:to_s).reduce(:+).to_i
  d567 = digits_array[4..6].map(&:to_s).reduce(:+).to_i
  d678 = digits_array[5..7].map(&:to_s).reduce(:+).to_i
  d789 = digits_array[6..8].map(&:to_s).reduce(:+).to_i
  d8910 = digits_array[7..9].map(&:to_s).reduce(:+).to_i

  d234 % 2 == 0 &&
    d345 % 3 == 0 &&
    d456 % 5 == 0 &&
    d567 % 7 == 0 &&
    d678 % 11 == 0 &&
    d789 % 13 == 0 &&
    d8910 % 17 == 0
end

fail unless property_satisfied?(1_406_357_289.to_s.split('').map(&:to_i))

puts DIGITS.permutation.select { |da| property_satisfied?(da) }.map { |da| da.map(&:to_s).reduce(:+).to_i }.reduce(:+)

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 043.rb
16695334890

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=43); please visit the site and donate to it if you find it useful)
Sub-string divisibility
Problem 43

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
=end

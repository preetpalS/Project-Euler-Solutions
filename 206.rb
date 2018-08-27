# coding: utf-8

# Taking advantage of the fact that last two digits must both be
# zeroes (since only numbers divisible by 10 have square with last
# digit equalling 0).
DIGITS = [1,2,3,4,5,6,7,8,9].map(&:to_s)
LOWER_BOUND = DIGITS.join('0').to_i
UPPER_BOUND = DIGITS.join('9').to_i

def has_form?(n)
  n_digits_str = n.to_s

  (0...9).map { |i| return false unless DIGITS[i] == n_digits_str[i * 2] }
  true
end

fail unless has_form?(LOWER_BOUND)
fail unless has_form?(UPPER_BOUND)

i = Math.sqrt(LOWER_BOUND).floor
until i % 2 == 1
  i = i - 1
end

ii  = i * i

until ii > UPPER_BOUND
  break if has_form?(ii)
  i = i + 2
  ii  = i * i
end

fail 'Failed to find solution.' unless has_form?(ii)

puts i * 10

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 206.rb
1389019170

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=206); please visit the site and donate to it if you find it useful)
Concealed Square
Problem 206

Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
where each “_” is a single digit.
=end

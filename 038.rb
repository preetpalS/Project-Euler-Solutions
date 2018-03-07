# coding: utf-8

def pandigital?(n)
  ar = n.to_s.split('').map(&:to_i).sort
  (0..(ar.length - 1)).each do |i|
    return false unless ar[i] == (1 + i)
  end
  true
end

fail unless pandigital?(987_654_321)

$max_relevant_pandigital = 0
ONE_TO_NINE_ARRAY = (1..9).to_a.freeze

(9.downto(2)).each do |x|
  i = 1

  loop do
    pd = ONE_TO_NINE_ARRAY[0...x].map do |e|
      e * i
    end.map(&:to_s).reduce(:+)
    i += 1
    redo if pd.length < 9
    pdi = pd.to_i
    break if pdi > 999_999_999
    redo unless pdi > $max_relevant_pandigital
    $max_relevant_pandigital = pdi if pandigital?(pdi)
  end
end

pp $max_relevant_pandigital

=begin
$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-freebsd11.1]

$ ruby 038.rb
932718654

=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=38); please visit the site and donate to it if you find it useful)
Pandigital multiples
Problem 38
Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
=end

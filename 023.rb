
require 'set'

# works for positive number inputs
def proper_divisors(n)
  (1..(n / 2)).select { |i| (n % i).zero? }
end

fail unless proper_divisors(0).length.zero?
fail unless proper_divisors(1).length.zero?
fail unless proper_divisors(2).length == 1
fail unless proper_divisors(220).reduce(:+) == 284
fail unless proper_divisors(284).reduce(:+) == 220

abundant_numbers = []
(1..28123).each do |i|
  pdivs = proper_divisors(i)
  next if pdivs.length.zero?
  res = pdivs.reduce(:+)
  abundant_numbers.push(i) if res > i
end

abundant_number_sums_leq_28123 = Set.new
abundant_numbers.length.times do |index1|
  (index1...(abundant_numbers.length)).each do |index2|
    temp_sum = abundant_numbers[index1] + abundant_numbers[index2]
    break if temp_sum > 28123
    abundant_number_sums_leq_28123.add temp_sum
  end
end

puts (
  (1..28123).select do |x|
    not abundant_number_sums_leq_28123.member?(x)
  end.compact.reduce(:+)
)


=begin
C:\ProjectEulerSolutions>ruby 023.rb
4179871

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

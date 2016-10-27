
# works for positive number inputs
def proper_divisors(n)
  (1..(n / 2)).select { |i| (n % i).zero? }
end

fail unless proper_divisors(0).length.zero?
fail unless proper_divisors(1).length.zero?
fail unless proper_divisors(2).length == 1
fail unless proper_divisors(220).reduce(:+) == 284
fail unless proper_divisors(284).reduce(:+) == 220

amicable_numbers = []
(1...10_000).each do |i|
  pdivs = proper_divisors(i)
  next if pdivs.length.zero?
  res = pdivs.reduce(:+)
  next if res == i
  amicable_numbers.push(i) if i == proper_divisors(res).reduce(:+)
end

puts amicable_numbers.reduce(:+)

=begin
C:\ProjectEulerSolutions>ruby 021.rb
31626

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

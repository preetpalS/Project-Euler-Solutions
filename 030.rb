
SEARCH_UPPER_BOUND = 6 * (9 ** 5) # 354294

solution = 0
(2..SEARCH_UPPER_BOUND).each do |i|
  solution = (solution + i) if i == i.to_s.split('').map(&:to_i).map { |x| x ** 5 }.reduce(:+)
end

puts solution

=begin
C:\ProjectEulerSolutions>ruby 030.rb
443839

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end


LETTER_SCORES = Hash[('A'..'Z').zip(1..26)]

names = File.read('022/p022_names.txt').strip[1..-2].split("\",\"").sort

name_scores_sum = 0
names.each_with_index do |name, index|
  name_sum = (index + 1) * name.split('').map { |c| LETTER_SCORES[c] }.reduce(:+)
  name_scores_sum = name_scores_sum + name_sum
end

puts name_scores_sum

=begin
C:\ProjectEulerSolutions>ruby 022.rb
871198282

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

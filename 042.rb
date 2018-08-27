# coding: utf-8

TRIANGLE_NUMBERS = []
LETTER_TO_ALPHABETICAL_POSITION_MAPPING = Hash[('A'..'Z').zip(1..26)]

def triangle_number?(n)
  while TRIANGLE_NUMBERS.empty? || n > TRIANGLE_NUMBERS[-1]
    x = TRIANGLE_NUMBERS.length + 1
    TRIANGLE_NUMBERS.push ((x * (x + 1)) / 2)
  end

  TRIANGLE_NUMBERS.include?(n)
end

words = File.read('data/042/p042_words.txt').strip.split(',').map { |w| w[1...-1] }

solution = words.select do |word|
  word_letters = word.upcase.split('')
  word_value = word_letters.map { |c| LETTER_TO_ALPHABETICAL_POSITION_MAPPING[c] }.reduce(:+)
  triangle_number? word_value
end.length

puts solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 042.rb
162

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=42); please visit the site and donate to it if you find it useful)
Coded triangle numbers
Problem 42

The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
=end


require 'set'
successful_login_attempts = File.read('data/079/p079_keylog.txt').strip.split(/\r?\n/).map(&:strip)

# Eliminating possible duplicate sequences (they may be asking for
# different character sequences from password (like (3th, 4th, 7th) vs
# (3th, 4th, 8th))) as they provide no additional information.
unique_successful_login_attempts = successful_login_attempts.uniq

# Testing if any successful login attempts contain duplicate digits.
fail if unique_successful_login_attempts.map { |sla| sla.split('').uniq }.any? { |arr| arr.length < 3 }

CHARACTER_HASH = Hash[(0..9).map { |c| [c.to_s, {before: Set.new, after: Set.new}]}]

def process_successful_login_attempt(successful_login_attempt)
  fail unless successful_login_attempt.length == 3

  c_arr = successful_login_attempt.split('')
  CHARACTER_HASH[c_arr[0]][:after].add(c_arr[1]) unless CHARACTER_HASH[c_arr[0]][:after].include?(c_arr[1])
  CHARACTER_HASH[c_arr[1]][:before].add(c_arr[0]) unless CHARACTER_HASH[c_arr[1]][:before].include?(c_arr[0])
  CHARACTER_HASH[c_arr[1]][:after].add(c_arr[2]) unless CHARACTER_HASH[c_arr[1]][:after].include?(c_arr[2])
  CHARACTER_HASH[c_arr[2]][:before].add(c_arr[1]) unless CHARACTER_HASH[c_arr[2]][:before].include?(c_arr[1])
end

unique_successful_login_attempts.each do |successful_login_attempt|
  process_successful_login_attempt successful_login_attempt
end

keys_to_delete = []
CHARACTER_HASH.each do |k, v|
  if v[:before].empty? && v[:after].empty?
    keys_to_delete.push k
  end
  fail if v[:before].intersect?(v[:after])
end
keys_to_delete.each { |k| CHARACTER_HASH.delete k }

# puts CHARACTER_HASH.inspect

solution_arr = []
CHARACTER_HASH.each do |k, v|
  if solution_arr.empty?
    solution_arr.push k
  else
    idx = solution_arr.index { |e| v[:after].include?(e) }
    if idx.nil?
      solution_arr.push k
    else
      solution_arr.insert(idx, k)
    end
  end
end

solution = solution_arr.reduce(:+)
puts solution

=begin
C:\Users\me\folder\Project-Euler-Solutions>ruby 079.rb
73162890

C:\Users\me\folder\Project-Euler-Solutions>ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x64-mingw32]

C:\Users\me\folder\Project-Euler-Solutions>
=end

=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=79); please visit the site and donate to it if you find it useful)
Passcode derivation
Problem 79

A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
The text file, keylog.txt, contains fifty successful login attempts.
Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.
=end

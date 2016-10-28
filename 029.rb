
require 'set'

EQUATION = ->(a, b) { a ** b }

distinct_terms = Set.new
(2..100).each do |a|
  (2..100).each do |b|
    distinct_terms.add EQUATION.call(a, b)
  end
end

puts distinct_terms.count

=begin
C:\ProjectEulerSolutions>ruby 029.rb
9183

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

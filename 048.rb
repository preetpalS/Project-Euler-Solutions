
puts (1..1000).map { |x| x ** x }.reduce(:+).to_s.split('').reverse.take(10).reverse.map(&:to_s).join('')

=begin
C:\ProjectEulerSolutions>ruby 048.rb
9110846700

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

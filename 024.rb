
puts (0..9).to_a.permutation(10).take(1_000_000).last.map(&:to_s).join('')

=begin
C:\ProjectEulerSolutions>ruby 024.rb
2783915460

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

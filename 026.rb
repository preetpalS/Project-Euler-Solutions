
longest_recurring_cycle_length = 0
solution = nil
(1..1000).each do |d|
  remainder_positions = {}
  val = 1
  index = 1
  while val % d != 0
    remainder = val % d
    if remainder_positions[remainder]
      recurring_cycle_length = index - remainder_positions[remainder]
      if recurring_cycle_length > longest_recurring_cycle_length
        longest_recurring_cycle_length = recurring_cycle_length
        solution = d
        puts "{ d: #{d}, recurring_cycle_length: #{recurring_cycle_length} }"
      end
      break
    else
      remainder_positions[remainder] = index
      val = 10 * remainder
      index = index + 1
    end
  end
end

puts solution

=begin
C:\ProjectEulerSolutions>ruby 026.rb
{ d: 3, recurring_cycle_length: 1 }
{ d: 7, recurring_cycle_length: 6 }
...
{ d: 977, recurring_cycle_length: 976 }
{ d: 983, recurring_cycle_length: 982 }
983

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end

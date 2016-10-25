
# Tested with Ruby 2.3.1

puts (2 ** 1000).to_s.split('').map { |digit| Integer(digit) }.reduce(:+) # 1366

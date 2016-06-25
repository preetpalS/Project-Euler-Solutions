
# Solution: 233168
p (1...1000).select { |x| [3, 5].any? { |y| x % y == 0 } }.reduce(:+)

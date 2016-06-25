
def prime?(n)
  return false if n < 2
  return true if n < 4
  return false if n.even?

  (3..(Math.sqrt n).ceil).each do |i|
    return false if n % i == 0
  end
  true
end

primes = Enumerator.new do|yielder|
  yielder.yield 2

  to_test = 3
  loop do
    yielder.yield to_test if prime?(to_test)

    to_test += 2
  end
end

# Solution: 142913828922
p primes.take_while { |i| i < 2_000_000 }.reduce(:+)

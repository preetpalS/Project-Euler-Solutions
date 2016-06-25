
=begin
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end

def special_pythagorean_triplet
  # a + b + c = 1000
  (0..1000).each do |c|
    (0..(1000 - c)).each do |b|
      (0..(1000 - b - c)).each do |a|
        return a * b * c if ((a * a) + (b * b)) == (c * c) if a + b + c == 1000
      end
    end
  end
end

# Solution: 31875000
p special_pythagorean_triplet


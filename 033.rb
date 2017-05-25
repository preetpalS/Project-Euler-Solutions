
=begin
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=end

curious_fractions = []

(10..98).each do |numerator|
  ((numerator + 1)..99).each do |denominator|
    next unless numerator.to_s[0] == denominator.to_s[1] || numerator.to_s[1] == denominator.to_s[0]
    a = Rational(numerator, denominator)
    b = Rational(numerator.to_s[0].to_i, denominator.to_s[1].to_i) if denominator.to_s[1].to_i != 0
    c = Rational(numerator.to_s[1].to_i, denominator.to_s[0].to_i) if denominator.to_s[0].to_i != 0

    if (c && a == c) || (b && a == b)
      curious_fractions.push a
    end
  end
end

fail unless curious_fractions.length == 4

puts curious_fractions.reduce(:*).denominator

=begin
C:\Project-Euler-Solutions>ruby -v
ruby 2.4.1p111 (2017-03-22 revision 58053) [x64-mingw32]

C:\Project-Euler-Solutions>ruby 033.rb
100

C:\Project-Euler-Solutions>
=end

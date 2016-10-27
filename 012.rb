
NUM_THREADS = 8

triangle_numbers = Enumerator.new do |yielder|
  ret = 1
  adder = 2
  loop do
    yielder << ret
    ret = ret + adder
    adder = adder + 1
  end
end

# Work for natural number inputs
def number_of_divisors(n)
  test_upper_bound = n / 2
  count = 1 # since n is divisible by itself
  (1..test_upper_bound).each do |x|
    count = count + 1 if n % x == 0
  end unless n == 1
  count
end

solution = nil
max_number_of_divisors = 0
temp = []
triangle_numbers.each do |triangle_number|
  temp << triangle_number

  if temp.length == NUM_THREADS
    puts "Finding number of divisors for triangle numbers in: #{temp}"
    number_of_divisors, triangle_number = temp.map do |triangle_number|
      Thread.new do
        [number_of_divisors(triangle_number), triangle_number]
      end
    end.map(&:value).sort.last

    if number_of_divisors > max_number_of_divisors
      puts "The triangle number #{triangle_number} has #{number_of_divisors} divisors."
      max_number_of_divisors = number_of_divisors

      if max_number_of_divisors > 500
        solution = triangle_number
        break
      end
    end
    temp = []
  end
end

puts solution # 76576500

=begin
C:\ProjectEulerSolutions> jruby 012.parallel.rb
...
Finding number of divisors for triangle numbers in: [75515905, 75528195, 75540486, 75552778, 75565071, 75577365, 75589660, 75601956]
Finding number of divisors for triangle numbers in: [75614253, 75626551, 75638850, 75651150, 75663451, 75675753, 75688056, 75700360]
Finding number of divisors for triangle numbers in: [75712665, 75724971, 75737278, 75749586, 75761895, 75774205, 75786516, 75798828]
Finding number of divisors for triangle numbers in: [75811141, 75823455, 75835770, 75848086, 75860403, 75872721, 75885040, 75897360]
Finding number of divisors for triangle numbers in: [75909681, 75922003, 75934326, 75946650, 75958975, 75971301, 75983628, 75995956]
Finding number of divisors for triangle numbers in: [76008285, 76020615, 76032946, 76045278, 76057611, 76069945, 76082280, 76094616]
Finding number of divisors for triangle numbers in: [76106953, 76119291, 76131630, 76143970, 76156311, 76168653, 76180996, 76193340]
Finding number of divisors for triangle numbers in: [76205685, 76218031, 76230378, 76242726, 76255075, 76267425, 76279776, 76292128]
Finding number of divisors for triangle numbers in: [76304481, 76316835, 76329190, 76341546, 76353903, 76366261, 76378620, 76390980]
Finding number of divisors for triangle numbers in: [76403341, 76415703, 76428066, 76440430, 76452795, 76465161, 76477528, 76489896]
Finding number of divisors for triangle numbers in: [76502265, 76514635, 76527006, 76539378, 76551751, 76564125, 76576500, 76588876]
The triangle number 76576500 has 576 divisors.
76576500

C:\ProjectEulerSolutions> jruby -v
jruby 9.1.5.0 (2.3.1) 2016-09-07 036ce39 Java HotSpot(TM) 64-Bit Server VM 25.112-b15 on 1.8.0_112-b15 +jit [mswin32-x86_64]

=end

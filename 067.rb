
triangle = File.read('data/067/p067_triangle.txt').strip.split("\n").map do |row|
  row.split(' ')
end.map do |row|
  row.map do |val|
    v = val.sub(/^0+/, '')
    if v == ''
      0
    else
      Integer(v)
    end
  end
end

accumulator = triangle.last.map { |_| 0 }
(triangle.length - 1).downto(0) do |row_index|
  row = triangle[row_index].zip(accumulator).map { |zipped_values| zipped_values.reduce(:+) }

  if row.length == 1
    accumulator = row
    break
  end

  accumulator = []
  (0...(row.length - 1)).each do |column_index|
    accumulator.push(
      row[column_index] > row[column_index + 1] ? row[column_index] : row[column_index + 1]
    )
  end
end

puts accumulator.first

=begin
C:\ProjectEulerSolutions>ruby 067.rb
7273

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end


grid = File.read('data/011/grid.txt').strip.split("\n").map do |row|
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

greatest_product = 0
(0...20).each do |x|
  (0...20).each do |y|
    # Test right (same as left 4 positions to the right)
    if (y + 3) < 20
      val = grid[x][y] * grid[x][y + 1] * grid[x][y + 2] * grid[x][y + 3]

      greatest_product = val if val > greatest_product
    end

    # Test down (same as up 4 positions downwards)
    if (x + 3) < 20
      val = grid[x][y] * grid[x + 1][y] * grid[x + 2][y] * grid[x + 3][y]

      greatest_product = val if val > greatest_product
    end

    # Test diagonal right
    if ((x + 3) < 20) && ((y + 3) < 20)
      val = grid[x][y] * grid[x + 1][y + 1] * grid[x + 2][y + 2] * grid[x + 3][y + 3]

      greatest_product = val if val > greatest_product
    end

    # Test diagonal left
    if ((x + 3) < 20) && ((y - 3) > -1)
      val = grid[x][y] * grid[x + 1][y - 1] * grid[x + 2][y - 2] * grid[x + 3][y - 3]

      greatest_product = val if val > greatest_product
    end
  end
end

puts greatest_product # 70600674

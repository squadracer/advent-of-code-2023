require 'set'
module Day11
  def self.parse(input)
    input.split("\n").map{ |line| line.chomp.chars }
  end

  def self.part1(input)
    board = parse(input)
    acc = 0
    rows = board.map do |line|
      acc += 1 if line.all? { |cell| cell == '.' }
      acc += 1
    end
    columns = board.transpose.map do |line|
      acc += 1 if line.all? { |cell| cell == '.' }
      acc += 1
    end
    galaxies = []
    board.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        galaxies << [x,y] if cell == '#'
      end
    end
    #warn galaxies.inspect
    galaxies.combination(2).sum do |(x1,y1), (x2,y2)|
      #warn [x1,y1,x2,y2,(columns[x2]-columns[x1]).abs, (rows[y2]-rows[y1]).abs, (columns[x2]-columns[x1]).abs + (rows[y2]-rows[y1]).abs].inspect
      (columns[x2]-columns[x1]).abs + (rows[y2]-rows[y1]).abs.abs
    end
  end

  def self.part2(input)
    board = parse(input)
    acc = 0
    rows = board.map do |line|
      if line.all? { |cell| cell == '.' }
        acc += 1_000_000
      else
        acc += 1
      end
    end
    columns = board.transpose.map do |line|
      if line.all? { |cell| cell == '.' }
        acc += 1_000_000
      else
        acc += 1
      end
    end
    galaxies = []
    board.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        galaxies << [x,y] if cell == '#'
      end
    end
    #warn galaxies.inspect
    galaxies.combination(2).sum do |(x1,y1), (x2,y2)|
      #warn [x1,y1,x2,y2,(columns[x2]-columns[x1]).abs, (rows[y2]-rows[y1]).abs, (columns[x2]-columns[x1]).abs + (rows[y2]-rows[y1]).abs].inspect
      (columns[x2]-columns[x1]).abs + (rows[y2]-rows[y1]).abs.abs
    end
  end
end
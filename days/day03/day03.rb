require 'set'
module Day03
  def self.parse(input)
    input.lines.map(&:chomp)
  end

  def self.part1(input)
    engine = parse(input)
    symbols = []
    engine.each_with_index do |line, y|
      line.each_char.with_index do |char, x|
        symbols << [x,y] if char[/[^0-9.]/]
      end
    end
    neighbours = [-1,0,1].product([-1,0,1])
    sum = 0
    symbols.each do |x,y|
      number_part = Set.new
      neighbours.each do |dx,dy|
        next if x+dx < 0 || y+dy < 0 || engine[y+dy].nil? || engine[y+dy][x+dx].nil?
        next unless engine[y+dy][x+dx][/\d/]
        next if number_part.member?([y+dy, x+dx])
        left = x+dx
        right = x+dx
        left -= 1 while left >= 0 && engine[y+dy][left][/\d/]
        right += 1 while engine[y+dy][right] && engine[y+dy][right][/\d/]
        sum += engine[y+dy][left + 1..right - 1].to_i
        number_part += (left..right).map { |coord| [y+dy, coord] }
      end
    end
    sum
  end

  def self.part2(input)
    engine = parse(input)
    gears = []
    engine.each_with_index do |line, y|
      line.each_char.with_index do |char, x|
        gears << [x,y] if char == '*'
      end
    end
    neighbours = [-1,0,1].product([-1,0,1])
    sum = 0
    gears.each do |x,y|
      number_part = Set.new
      parts = []
      neighbours.each do |dx,dy|
        next if x+dx < 0 || y+dy < 0 || engine[y+dy].nil? || engine[y+dy][x+dx].nil?
        next unless engine[y+dy][x+dx][/\d/]
        next if number_part.member?([y+dy, x+dx])
        
        left = x+dx
        right = x+dx
        left -= 1 while engine[y+dy][left][/\d/]
        right += 1 while engine[y+dy][right] && engine[y+dy][right][/\d/]
        parts << engine[y+dy][left + 1 .. right - 1].to_i
        number_part += (left..right).map { |coord| [y+dy, coord] }
      end
      if parts.size == 2
        sum += parts[0] * parts[1]
      end
    end
    sum
  end
end
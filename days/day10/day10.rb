require 'set'
module Day10
  def self.parse(input)
    input.split("\n").map{ |line| line.chomp.chars }
  end

  def self.part1(input)
    board = parse(input)
    x = nil
    y = board.index { |line| x = line.index('S') }
    current = [x,y+1]
    dir = [0, 1]
    turn = 1
    while current != [x,y]
      current_x, current_y = current
      case dir
      when [1, 0]
        case board[current_y][current_x]
        when 'J'
          dir = [0, -1]
        when '7'
          dir = [0, 1]
        end
      when [-1, 0]
        case board[current_y][current_x]
        when 'L'
          dir = [0, -1]
        when 'F'
          dir = [0, 1]
        end
      when [0, 1]
        case board[current_y][current_x]
        when 'L'
          dir = [1, 0]
        when 'J'
          dir = [-1, 0]
        end
      when [0, -1]
        case board[current_y][current_x]
        when 'F'
          dir = [1, 0]
        when '7'
          dir = [-1, 0]
        end
      end

      current = current.zip(dir).map(&:sum)
      turn += 1
    end
    warn turn
    turn / 2
  end

  def self.part2(input)
    board = parse(input)
    x = nil
    y = board.index { |line| x = line.index('S') }
    current = [x,y+1]
    board[y][x] = '7'
    warn board[y][x]
    dir = [0, 1]
    turn = 1
    visited = Set[[x,y]]
    while current != [x,y]
      visited << current
      current_x, current_y = current
      case dir
      when [1, 0]
        case board[current_y][current_x]
        when 'J'
          dir = [0, -1]
        when '7'
          dir = [0, 1]
        end
      when [-1, 0]
        case board[current_y][current_x]
        when 'L'
          dir = [0, -1]
        when 'F'
          dir = [0, 1]
        end
      when [0, 1]
        case board[current_y][current_x]
        when 'L'
          dir = [1, 0]
        when 'J'
          dir = [-1, 0]
        end
      when [0, -1]
        case board[current_y][current_x]
        when 'F'
          dir = [1, 0]
        when '7'
          dir = [-1, 0]
        end
      end

      current = current.zip(dir).map(&:sum)
    end
    counted = Set.new
    count = 0
    board.each_with_index do |line, current_y|
      buffer = []
      line.each_with_index do |c, current_x|
        if current_y == 4
          warn buffer.inspect
        end
        if visited.member?([current_x, current_y])
          if board[current_y][current_x] == '7'
            last = buffer.pop
            if last == 'L'
              buffer << '|'
            end
          elsif board[current_y][current_x] == '|'
            buffer << '|'
          elsif board[current_y][current_x] == 'J'
            last = buffer.pop
            if last == 'F'
              buffer << '|'
            end
          elsif board[current_y][current_x] != '-'
            buffer << board[current_y][current_x]
          end
        else
          if buffer.size.odd?
            count += 1
            counted << [current_x, current_y]
          end
        end
      end
    end
    warn board.map.with_index { |line, y| line.map.with_index { |cell, x| visited.member?([x,y]) ? cell : '.'}.join}
    warn counted.inspect
    count
  end
end

# FF7FSF7F7F7F7F7F---7
# L|LJ||||||||||||F--J
# FL-7LJLJ||||||LJL-77
# F--JF--7||LJLJIF7FJ-
# L---JF-JLJIIIIFJLJJ7
# |F|F-JF---7IIIL7L|7|
# |FFJF7L7F-JF7IIL---7
# 7-L-JL7||F7|L7F-7F7|
# L.L7LFJ|||||FJL7||LJ
# L7JLJL-JLJLJL--JLJ.L
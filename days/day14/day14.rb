require 'set'
module Day14
  def self.parse(input)
    lines = input.lines.map do |line|
      ['#',*line.chomp.chars, '#']
    end
    [['#']*lines[0].size, *lines, ['#']*lines[0].size]
  end

  def self.part1(input)
    board = parse(input)
    transposed_board = board.transpose
    transposed_board.sum do |line|
      lock = 0
      warn line.join
      score = 0
      line.each_index do |index|
        cell = line[index]
        if cell == '#'
          lock = index + 1
        elsif cell == 'O'
          line[index] = '.'
          line[lock] = 'O'
          score += line.size - lock - 1
          lock = lock + 1
        end
      end
      score
    end
  end

  def self.move(board)
    board.map do |line|
      lock = 0
      line.each_index do |index|
        cell = line[index]
        if cell == '#'
          lock = index + 1
        elsif cell == 'O'
          line[index] = '.'
          line[lock] = 'O'
          lock = lock + 1
        end
      end
      line
    end
  end

  def self.cycle(board)
    board = move(board.transpose).transpose
    board = move(board)
    board = move(board.reverse.transpose).transpose.reverse
    board = move(board.map(&:reverse)).map(&:reverse)
  end

  def self.part2(input)
    board = parse(input)
    memo = {}
    cycle_end = (1..).find do |turn|
      board = cycle(board)
      found = memo.key?(board)
      next true if found
      memo[board] = turn
      false
    end
    cycle_length = cycle_end - memo[board]
    warn cycle_length, cycle_end
    final = 1_000_000_000
    remaining = final - cycle_end
    warn remaining
    remaining -= cycle_length * (remaining / cycle_length)
    warn remaining
    remaining.times do
      board = cycle(board)
    end
    board.transpose.sum do |line|
      score = 0
      line.each_with_index do |cell, index|
        score += line.size - index - 1 if cell == 'O'
      end
      score
    end
  end
end

# After 1 cycle:
# .....#....
# ....#...O#
# ...OO##...
# .OO#......
# .....OOO#.
# .O#...O#.#
# ....O#....
# ......OOOO
# #...O###..
# #..OO#....

# After 2 cycles:
# .....#....
# ....#...O#
# .....##...
# ..O#......
# .....OOO#.
# .O#...O#.#
# ....O#...O
# .......OOO
# #..OO###..
# #.OOO#...O

# After 3 cycles:
# .....#....
# ....#...O#
# .....##...
# ..O#......
# .....OOO#.
# .O#...O#.#
# ....O#...O
# .......OOO
# #...O###.O
# #.OOO#...O
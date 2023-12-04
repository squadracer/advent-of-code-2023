require 'set'
module Day02
  def self.parse(input)
    games = {}
    input.each_line do |line|
      id, game = line.split(': ')
      id = id[/\d+/].to_i
      rounds = game.split('; ')
      games[id] = rounds.map do |round|
        cubes = round.split(', ')
        cubes.to_h do |cube|
          count, color = cube.split
          count = count.to_i
          [color, count]
        end
      end
    end
    games
  end

  def self.part1(input)
    #12 red cubes, 13 green cubes, and 14 blue cubes
    limits = {"blue" => 14, "green" => 13, "red" => 12}
    games = parse(input)
    possible_games = games.filter do |id, rounds|
      rounds.all? do |round|
        round.keys.all? do |color|
          round[color] <= limits[color]
        end
      end
    end
    possible_games.keys.sum
  end

  def self.part2(input)
    games = parse(input)
    games.sum do |id, rounds|
      minimum_cubes = rounds.reduce do |result, round|
        round.keys.each do |color|
          result[color] = round[color] if round[color] > result[color].to_i
        end
        result
      end
      minimum_cubes.values.reduce(:*)
    end
  end
end
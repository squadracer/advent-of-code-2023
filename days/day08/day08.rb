require 'set'
module Day08
  def self.parse(input)
    directions, maps = input.split("\n\n")
    graph = maps.lines.to_h { |line| source,left, right = line.scan(/[A-Z]+/);[source, [left, right]]}
    [directions, graph]
  end

  def self.part1(input)
    directions, graph = parse(input)
    current_node = 'AAA'
    directions.chars.cycle.find_index do |direction|
      if direction == 'L'
        current_node = graph[current_node].first
      else
        current_node = graph[current_node].last
      end
      current_node == 'ZZZ'
    end + 1
  end

  def self.part2(input)
    directions, graph = parse(input)
    start_nodes = graph.keys.filter { |node| node[-1] == 'A'}
    current_node = 'AAA'
    start_nodes.map do |start_node|
      current_node = start_node
      directions.chars.cycle.find_index do |direction|
        if direction == 'L'
          current_node = graph[current_node].first
        else
          current_node = graph[current_node].last
        end
        current_node[-1] == 'Z'
      end + 1
    end.reduce(&:lcm)
  end
end
require 'set'
module Day04
  def self.parse(input)
    cards = {}
    input.each_line do |line|
      id, card = line.split(': ')
      winning, numbers = card.split(' | ').map { |numbers| numbers.split.map(&:to_i) }
      id = id[/\d+/].to_i
      cards[id] = [winning, numbers]
    end
    cards
  end

  def self.part1(input)
    cards = parse(input)
    cards.values.sum do |winning, numbers|
      winning_count = (winning&numbers).size
      winning_count > 0 ? 2**(winning_count-1) : 0
    end
  end

  def self.part2(input)
    cards = parse(input)
    values = Array.new(cards.size+1, 0)
    total_score = 0
    cards.reverse_each do |id, (winning, numbers)|
      winning_count = (winning&numbers).size
      won_cards_count = (winning_count)
      values[id] = 1 + values[id+1,won_cards_count].sum
    end
    values.sum
  end
end
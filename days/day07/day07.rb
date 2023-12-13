require 'set'
module Day07
  def self.parse(input)
    input.split("\n").map{|line| hand, bid = line.split; [hand, bid.to_i]}
  end

  def self.value(hand)
    counts = hand.chars.tally.values.sort
    val = 0
    if counts[-1] == 5
      val = 6
    elsif counts[-1] == 4
      val = 5
    elsif counts[-1] == 3 && counts[-2] == 2
      val = 4
    elsif counts[-1] == 3
      val = 3
    elsif counts[-1] == 2 && counts[-2] == 2
      val = 2
    elsif counts[-1] == 2
      val = 1
    end
    [val, hand.tr('TJQKA','ABCDE')]
  end


  def self.part1(input)
    bids = parse(input).sort_by { |hand, bid| value(hand)}.map(&:last).each_with_index.sum { |a,i| a*(i+1) }
  end

  def self.value_part2(hand)
    counts = hand.chars.tally
    jokers = counts["J"].to_i
    counts = counts.except("J").values.sort
    counts = [0] if counts.empty?
    val = 0
    counts[-1] += jokers
    if counts[-1] == 5
      val = 6
    elsif counts[-1] == 4
      val = 5
    elsif counts[-1] == 3 && counts[-2] == 2
      val = 4
    elsif counts[-1] == 3
      val = 3
    elsif counts[-1] == 2 && counts[-2] == 2
      val = 2
    elsif counts[-1] == 2
      val = 1
    end
    [val, hand.tr('TJQKA','A0CDE')]
  end

  def self.part2(input)
    bids = parse(input).sort_by { |hand, bid| value_part2(hand)}.map(&:last).each_with_index.sum { |a,i| a*(i+1) }
  end
end
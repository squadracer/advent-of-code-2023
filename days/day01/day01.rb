module Day01
  def self.parse(input)
    input = input.split("\n")
  end

  def self.part1(input)
    parse(input).map{digits=_1.scan(/\d/);[digits.first,digits.last].join}.sum(&:to_i)
  end

  def self.part2(input)
    numbers = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" =>9}
    (0..9).each { |i| numbers[i.to_s] = i }
    parse(input).map do |line|
      digits = line.scan(/#{numbers.keys.map{"(?=(#{_1}))"}.join('|')}/).flatten.compact
      numbers[digits.first] * 10 + numbers[digits.last]
    end.sum
  end
end
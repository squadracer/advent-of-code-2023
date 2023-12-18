require 'set'
module Day15
  def self.parse(input)
    input.split(',')
  end

  def self.hash(line)
    current = 0
    line.each_byte do |c|
      current = ((current + c)*17)%256
    end
    current
  end

  def self.part1(input)
    params = parse(input)
    params.sum { hash(_1)}
  end

  def self.part2(input)
    params = parse(input)
    boxes = Array.new(256) { {} }
    params.each do |x|
      if x[-1] == '-'
        variable = x.chop
        box = boxes[hash(variable)]
        box.delete(variable)
      else
        variable, value = x.split('=')
        box = boxes[hash(variable)]
        box[variable] = value.to_i
      end
    end
    sum = 0
    boxes.each_with_index do |box, index|
      box.each_value.with_index do |val, index2|
        sum += (index + 1) * (index2 + 1) * val
      end
    end
    sum
  end
end
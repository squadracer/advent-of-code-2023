require 'set'
module Day09
  def self.parse(input)
    input.lines.map{ |line| line.split.map(&:to_i)}
  end

  def self.derivate(values)
    return 0 if values.all?(&:zero?)

    differences = values.each_cons(2).map { |a,b| b-a }
    last_addition = derivate(differences)
    return values.last + last_addition
  end

  def self.reverse_derivate(values)
    return 0 if values.all?(&:zero?)

    differences = values.each_cons(2).map { |a,b| b-a }
    first_addition = reverse_derivate(differences)
    return values.first - first_addition
  end

  def self.part1(input)
    variables = parse(input)
    variables.sum do |variable|
      derivate(variable)
    end
  end

  def self.part2(input)
    variables = parse(input)
    variables.sum do |variable|
      reverse_derivate(variable)
    end
  end
end
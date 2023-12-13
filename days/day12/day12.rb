require 'set'
module Day12
  def self.parse(input)
    input.lines.map do |line|
      line, numbers = line.split
      numbers = numbers.split(',').map(&:to_i)
      [line, numbers]
    end
  end

  def self.verify(line)
    line.scan(/#+/).map(&:size)
  end

  def self.part1(input)
    lines = parse(input)
    n=0
    lines.sum do |line, numbers|
      warn n+= 1
      count = 0
      l = line.count('?')
      (2**l).times do |i|
        x = i.to_s(2).rjust(l,'0').tr('01', '.#')
        current = -1
        s = line.gsub('?'){x[current+=1]}
        count += 1 if verify(s) == numbers
      end
      count
    end
  end

  REGEX1 = /#*\?.*/
  REGEX2 = /#+\?/
  def self.possible?(line, numbers)
    # @i ||= 0
    # @i += 1
    # exit if @i == 100
    index = line.index('?')
    return true if index.nil? || index == 0
    i2 = index - 1
    i2 -= 1 while i2 >= 0 && line[i2] == '#'
    i2 += 1
    x = line[...i2]
    #warn line,i2,"x="+x
    a = verify(x)
    if line[x.size] == '#'
      b = index - i2
      #warn line,b
      return false if a.size+1 > numbers.size || b > numbers[a.size]
    end
    a.size <= numbers.size && a.zip(numbers).all? { |a,b| a==b }
    
  end


  def self.backtrack(line, numbers)
    unless possible?(line, numbers)
      #warn line
      return 0
    end
    return verify(line) == numbers ? 1:0 if line.count('?') == 0
    
    backtrack(line.sub('?','.'), numbers) + backtrack(line.sub('?','#'), numbers)
  end

  HASH = {}
  def self.solve(line, groups, current_group = 0)
    return HASH[[line, groups, current_group]] if HASH.key?([line, groups, current_group])
    if line.empty?
      #warn groups.empty? && current_group == 0 
      return groups.empty? && current_group == 0 ? 1 : 0

    end
    #warn [line, groups, current_group].inspect
    count = 0
    possibles = line[0] == '?' ? ['#', '.'] : [line[0]]
    possibles.each do |c|
      if c == '#'
        count += solve(line[1..], groups, current_group + 1)
      else
        if current_group == 0
          count += solve(line[1..], groups)
        elsif groups[0] == current_group
          count += solve(line[1..], groups[1..], 0)
        end
      end
    end
    HASH[[line, groups, current_group]] = count
  end

  def self.part2(input)
    lines = parse(input)
    n=0
    i = 0
    lines.sum do |line, numbers|
      warn i+=1
      line = [line]*5*'?'
      numbers = numbers*5
      solve(line+'.', numbers)
      #backtrack(line, numbers)
    end
  end
end
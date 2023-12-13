require './days/day12/day12'
RSpec.describe Day12, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day12/sample').read
    expect(Day12.part1(str)).to eq 21
  end

  it 'part 1 works with input' do
    str = File.open('./days/day12/input').read
    expect(Day12.part1(str)).to eq nil
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day12/sample').read
    expect(Day12.part2(str)).to eq 525152
  end

  it 'part 2 works with input' do
    str = File.open('./days/day12/input').read
    expect(Day12.part2(str)).to eq 6512849198636
  end
end
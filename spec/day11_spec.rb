require './days/day11/day11'
RSpec.describe Day11, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day11/sample').read
    expect(Day11.part1(str)).to eq 374
  end

  it 'part 1 works with input' do
    str = File.open('./days/day11/input').read
    expect(Day11.part1(str)).to eq nil
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day11/sample').read
    expect(Day11.part2(str)).to eq nil
  end

  it 'part 2 works with input' do
    str = File.open('./days/day11/input').read
    expect(Day11.part2(str)).to eq nil
  end
end
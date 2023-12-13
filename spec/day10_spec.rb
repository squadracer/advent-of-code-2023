require './days/day10/day10'
RSpec.describe Day10, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day10/sample').read
    expect(Day10.part1(str)).to eq 8
  end

  it 'part 1 works with input' do
    str = File.open('./days/day10/input').read
    expect(Day10.part1(str)).to eq nil
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day10/sample2').read
    expect(Day10.part2(str)).to eq 10
  end

  it 'part 2 works with input' do
    str = File.open('./days/day10/input').read
    expect(Day10.part2(str)).to eq nil
  end
end
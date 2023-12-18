require './days/day15/day15'
RSpec.describe Day15, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day15/sample').read
    expect(Day15.part1(str)).to eq 1320
  end

  it 'part 1 works with input' do
    str = File.open('./days/day15/input').read
    expect(Day15.part1(str)).to eq nil
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day15/sample').read
    expect(Day15.part2(str)).to eq 145
  end

  it 'part 2 works with input' do
    str = File.open('./days/day15/input').read
    expect(Day15.part2(str)).to eq nil
  end
end
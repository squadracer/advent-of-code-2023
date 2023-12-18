require './days/day14/day14'
RSpec.describe Day14, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day14/sample').read
    expect(Day14.part1(str)).to eq 136
  end

  it 'part 1 works with input' do
    str = File.open('./days/day14/input').read
    expect(Day14.part1(str)).to eq 109424
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day14/sample').read
    expect(Day14.part2(str)).to eq 64
  end

  it 'part 2 works with input' do
    str = File.open('./days/day14/input').read
    expect(Day14.part2(str)).to eq nil
  end
end
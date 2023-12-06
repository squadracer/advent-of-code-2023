require './days/day05/day05'
RSpec.describe Day05, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day05/sample').read
    expect(Day05.part1(str)).to eq 35
  end

  it 'part 1 works with input' do
    str = File.open('./days/day05/input').read
    expect(Day05.part1(str)).to eq 261668924
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day05/sample').read
    expect(Day05.part2(str)).to eq 46
  end

  it 'part 2 works with input' do
    str = File.open('./days/day05/input').read
    expect(Day05.part2(str)).to eq 24261545
  end
end
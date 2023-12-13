require './days/day07/day07'
RSpec.describe Day07, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day07/sample').read
    expect(Day07.part1(str)).to eq 6440
  end

  it 'part 1 works with input' do
    str = File.open('./days/day07/input').read
    expect(Day07.part1(str)).to eq 248559379
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day07/sample').read
    expect(Day07.part2(str)).to eq 5905
  end

  it 'part 2 works with input' do
    str = File.open('./days/day07/input').read
    expect(Day07.part2(str)).to eq 249631254
  end
end
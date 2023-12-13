require './days/day08/day08'
RSpec.describe Day08, '#solve' do
  it 'part 1 works with sample' do
    str = File.open('./days/day08/sample').read
    expect(Day08.part1(str)).to eq 2
  end

  it 'part 1 works with sample' do
    str = File.open('./days/day08/sample2').read
    expect(Day08.part1(str)).to eq 6
  end

  it 'part 1 works with input' do
    str = File.open('./days/day08/input').read
    expect(Day08.part1(str)).to eq 19951
  end

  it 'part 2 works with sample' do
    str = File.open('./days/day08/sample3').read
    expect(Day08.part2(str)).to eq 6
  end

  it 'part 2 works with input' do
    str = File.open('./days/day08/input').read
    expect(Day08.part2(str)).to eq 16342438708751
  end
end
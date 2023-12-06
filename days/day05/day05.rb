require 'set'
module Day05
  def self.parse(input)
    seeds, *maps =  input.split("\n\n")
    seeds = seeds.scan(/\d+/).map(&:to_i)
    maps = maps.map do |map|
      name, *translations = map.split("\n")
      source_object, target_object =  name.scan(/(\w+)\-to\-(\w+)/)[0]
      translations.map do |translation|
        target, source, length = translation.split.map(&:to_i)
        [source, target, length]
      end.sort
    end
    [seeds, maps]
  end

  def self.part1(input)
    seeds, maps = parse(input)
    seeds.map do |seed|
      current_id = seed
      maps.each do |map|
        translation = map.find { |source, target, length| source < current_id && current_id - source < length }
        if translation
          current_id = current_id - translation[0] + translation[1]
        end
      end
      current_id
    end.min
  end

  def self.bfs(seed_range, map)
    @I ||= 0
    @I += 1
    warn @I
    translation_index = map.index { |source, target, length| source + length > seed_range[0] }
    return [seed_range] if translation_index.nil?
    result_ranges = []
    while seed_range[1] > 0 #TODO
      source_index, target_index, length = map[translation_index]
      if map[translation_index].nil?
        result_ranges << seed_range
        return result_ranges
      end
      if seed_range[0] < source_index
        range_length = [source_index - seed_range[0], seed_range[1]].min
        result_ranges << [seed_range[0], range_length]
        seed_range = [source_index, seed_range[1] - range_length]
      else
        range_length = [source_index + length - seed_range[0], seed_range[1]].min
        result_ranges << [target_index + seed_range[0] - source_index, range_length]
        seed_range = [seed_range[0] + range_length, seed_range[1] - range_length]
        translation_index += 1
      end
    end
    result_ranges
  end

  def self.part2(input)
    seeds, maps = parse(input)
    seeds_ranges = seeds.each_slice(2)
    maps.each do |map|
      seeds_ranges = seeds_ranges.flat_map do |seeds_range|
        result = bfs(seeds_range, map)
        result
      end
    end
    seeds_ranges.map(&:first).min
  end
end
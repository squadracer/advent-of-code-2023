require 'fileutils'
day =  ARGV.first.rjust(2,'0')
file = File.open("days/template/dayXX.rb")
target_folder = Dir.mkdir("days/day#{day}")
folder = "days/template"
filenames = Dir.entries(folder) - ['.','..']
filenames.each do |filename|
    file = File.open("days/template/#{filename}")
    file_data = file.read.gsub('XX',day)
    File.open("days/day#{day}/#{filename.gsub('XX',day)}", "w") { |f| f.write file_data }
end
File.rename "days/day#{day}/day#{day}_spec.rb", "spec/day#{day}_rspec.rb"
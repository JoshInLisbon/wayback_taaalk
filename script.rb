require 'nokogiri'

Dir.each_child("t") do |d|
  dir = "t/" + d
  puts dir
  Dir.each_child(dir) do |f|
    file = File.open(f)
    puts Nokogiri::HTML(file)
  end
end
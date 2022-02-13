Dir.each_child("t") do |d|
  dir = "t/" + d
  puts dir
  Dir.each_child(dir) do |f|
    file = File.open(f)
    file_data = file.read
    puts file_data[0, 30]
  end
end
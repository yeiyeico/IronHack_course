#small exercise

puts "what is the source file?"
source_file = "my_file.txt"
puts "#{source_file}"

puts "what is the destination file?"

contenido = IO.read("my_file.txt")
destination_file = IO.write('target.txt', contenido)
puts "#{destination_file}"


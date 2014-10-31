
# this line prints hello - esto es un comentario en ruby
puts "Hello world!"


#reading and whiting files
file_contents = IO.read("hello.rb")
puts "the file contains: #{file_contents}"

puts "your name?"
name = gets.chomp
IO.write('name.txt', name)


require 'terminfo'

#start the iterminal

class Iterminal
	def initialize(file_reader)
		@file_reader = FileReader.new(file_reader)
		@show_to_screen = ConsoleManager.new
	end

	def start_iterminal
		@line_position = 0
		@lines = @file_reader.split_txt
		manage_slides
	end

	def manage_slides
		end_slide = false
		
		while !end_slide
			@show_to_screen.show(@lines[@line_position])
			input = @show_to_screen.user_input
			
			if input == "n"
				@line_position +=1
				if @line_position == @lines.size
					end_slide = true
				end
			end

			if input == "p" && @line_position > 0
				@line_position -=1
			end
		end
	end
end

#read the file

class FileReader
	def initialize(file)
		@file_reader = IO.read(file)
	end

	def split_txt 
		lineParts = @file_reader.split("\n----\n")
	end
end

#put into the screen

class ConsoleManager
	def show (line)
		screen_size = TermInfo.screen_size
		columns = screen_size[1]
		rows = screen_size[0]

		padding_colums = (columns - 30) / 2
		padding_rows = (rows - 1) / 2
		(1..padding_rows).each {puts}
		(1..padding_colums).each {print " "}
		print(line)
		(1..padding_rows).each {puts}
	end

	def user_input
		print ">"
		@user_input = gets.chomp
	end
end

runIterminal = Iterminal.new("iterminal.txt")

runIterminal.start_iterminal
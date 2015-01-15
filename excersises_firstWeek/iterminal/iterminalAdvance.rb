
require 'terminfo'

#start the iterminal

class Iterminal
	def initialize(file_reader)
		@file_reader = FileReader.new(file_reader)
	end

	def start_iterminal
		@lines = @file_reader.split_txt
		slides = []
		@lines.each do |text|
			slides.push(Slide.new(text))
		end
		manage_slides(slides)
	end

	def manage_slides (slides) 
		slide_position = 0
		end_slide = false

		while !end_slide
			@show_slide.show(slides[slide_position])
			
			input = ConsoleManager.new.user_input
			
			if input == "n"
				@line_position +=1
				if @line_position == slides.size
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
		@lineParts = @file_reader.split("\n----\n")
	end	
end


class Slide
	def initialize(text)
		@text = text
	end

	def show_slide
		@show_slide = ConsoleManager.new
	end
end

#put into the screen

class ConsoleManager
	def show (line)
		screen_size = TermInfo.screen_size
		columns = screen_size[1]
		rows = screen_size[0]

		padding_colums = (columns - 30) / 2
		padding_rows = (rows - 3) / 2
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



runIterminal = Iterminal.new("iTerminalAdvance.txt")

runIterminal.start_iterminal
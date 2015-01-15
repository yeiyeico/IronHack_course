require "pry"

class FileReader
	def initialize(file)
		@file_reader = IO.read(file)
	end

	def show_list
		#binding.pry
		@splitted_text = []
		@file_reader.each_line do |word|
			@splitted_text << word.chomp
		end
		return @splitted_text
	end
end

class Anagrams 
	def initialize(file_reader)
		@file_reader = FileReader.new(file_reader)
	end

	def read_words
	 	@file_reader.show_list
	end

	def find_potencial_anagrams

	end

end



# anagrams = Anagrams.new("anagrams.txt")

# anagrams.reading_anagrams

#test

RSpec.describe "Creating Anagrams" do
	#let(:worldCells){WorldCells.new}

 	it "reading file" do
		expect(Anagrams.new("anagrams.txt").read_words).to eq(["add", "pato", "malla"])
	end

	it "Finding the potencial words for anagrams" do
		expect(Anagrams.new("anagrams.txt").find_potencial_anagrams).to eq(["add", "pato", "malla"])
	end
	

end
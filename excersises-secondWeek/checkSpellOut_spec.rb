require "pry"

class SpellOut
	def initialize
		@number_hash = { 
			1 => "one", 
			2 => "two", 
			3 => "three", 
			4 => "four",
			5 => "five",
			6 => "six",
			7 => "seven",
			8 => "eight", 
			9 => "nine", 
			10 => "ten", 
			11 => "eleven", 
			12 => "twelve" 
			}

		@decas_hash = { 
			20 => "twenty",
			30 => "thirty",
			40 => "forty",
			50 => "fifty",
			60 => "sixty",
			70 => "seventy",
			80 => "eighty",
			90 => "ninety",
		}
	end

	def number_names(item)
		if is_firstnum(item)
			@number_hash[item]
		
		elsif is_teen_numb(item)
			number_teen(item) 
		
		elsif is_deca(item)
			number_deca(item)
		
		elsif is_cent(item)
			number_cent(item)

		elsif is_thousand(item)
			number_thousands(item)
		end
	end

	def is_firstnum(item)
		item > 0 && item < 13
	end

	def is_teen_numb(item)
		item >= 14 && item <= 19
	end

	def number_teen(item)
		@number_hash[item-10] + "teen"
	end

	def is_deca(item)
		item >= 20 && item <= 99
	end
	
	def number_deca(item)
		if item % 10 == 0
			@decas_hash[item]
		else
			rest = item % 10
			@decas_hash[item-rest] + @number_hash[rest]
		end
	end

	def is_cent(item)
		item >=100 && item <=999
	end

	def define_cents(item)
	 	if is_teen_numb(item)
		  	number_teen(item)
		else
			number_deca(item)	
		end
	end

	def number_cent(item)		
		rest = item % 100
		if rest == 0
			@number_hash[item/100] + "hundred"	
		elsif rest != 0
			@number_hash[item/100] + "hundred" + define_cents(rest)
		end
	end

	def is_thousand(item)
		item >= 1000 && item <=9999
	end

	def number_thousands(item)
		rest = item % 1000
		if rest == 0
			@number_hash[item/1000] + "thousand"
		elsif rest !=0
			@number_hash[item/1000] + "thousand" + number_cent(rest)
		end 
	end

end

RSpec.describe "String calculator" do

	it "print number names" do
		expect(SpellOut.new.number_names(1)).to eq("one")
	end

	it "print number with teen" do
		expect(SpellOut.new.number_names(14)).to eq("fourteen")
	end

	it "print decas name" do
		expect(SpellOut.new.number_names(20)).to eq("twenty")
	end

	it "print decas with a number name" do
		expect(SpellOut.new.number_names(21)).to eq("twentyone")
	end

	it "print hundred names % 100" do
		expect(SpellOut.new.number_names(200)).to eq("twohundred")
	end

	it "print hundred names % 100 plus deca end in teen" do
		expect(SpellOut.new.number_names(216)).to eq("twohundredsixteen")
	end

	it "print hundred names % 100 plus deca ends" do
		expect(SpellOut.new.number_names(225)).to eq("twohundredtwentyfive")
	end

	it "print hundred names % 100 plus deca ends" do
		expect(SpellOut.new.number_names(225)).to eq("twohundredtwentyfive")
	end

	it "print hundred names % 1000" do
		expect(SpellOut.new.number_names(2000)).to eq("twothousand")
	end

	it "print hundred names % 1000 and had another number in cents" do
		expect(SpellOut.new.number_names(2360)).to eq("twothousandthreehundredsixty")
	end

end

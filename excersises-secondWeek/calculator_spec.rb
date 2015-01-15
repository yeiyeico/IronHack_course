class Calculator
	def add(numbers)
		
		without_space = numbers.gsub("\n", ",")
		without_semicolon = without_space.gsub(";", ",")
		
		final_array = without_semicolon.split(",")
				
		total_sum = 0

		if numbers[0..1] == "//"
			
		end

		final_array.each do |sum_numbers|
			total_sum += sum_numbers.to_i
		end
		return total_sum
	end

	# def delimiter

	# end
end


# codigo para testear el codigo con RSpec
RSpec.describe "String calculator" do

	let(:calculator){Calculator.new}

	it "zero digits" do
		expect(calculator.add('')).to eq(0)
	end

	it "one digit" do
		expect(calculator.add('3')).to eq(3)
	end

	it "two digits" do
		expect(calculator.add('23')).to eq(23)
	end

	it "three digits" do
		expect(calculator.add('2,3,5')).to eq(10)
	end

	it "any digits" do
		expect(calculator.add('2,3,5,9,400,30,65')).to eq(514)
	end

	it "line breaks" do
		expect(calculator.add("1\n2,3")).to eq(6)
	end
	it "other delimiters" do
		expect(calculator.add("//;\n1;2")).to eq(3)
	end
	it "other different delimiters" do
		expect(calculator.add("//patata\n1patata2")).to eq(3)
	end
end



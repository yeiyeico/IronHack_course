class Fizzbuzz
	def initialize (max_number)
		@max_number = max_number
	end

	def count
		(0..@max_number).each do |i|
			if (i % 5 == 0 && i % 3 == 0) then 
				puts "FizzBuzz"
			elsif (i % 3 == 0) then
				puts "Fizz"
			elsif (i % 5 == 0) then
				puts "Buzz"
			else
				puts i
			end
		end	
	end
end

number_name = Fizzbuzz.new(100)

number_name.count

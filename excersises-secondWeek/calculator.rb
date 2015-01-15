class Calculator
	
	def add(numbers)
		@numbers = numbers
		
		if @numbers  == 0
			return 0
		else @numbers >= 0
			return @numbers
		end
	end

end



if Calculator.new.add('')!=0
	Puts "Error! It can't add an empty string"
end

calculo1= Calculator.new.add(3)

puts calculo1
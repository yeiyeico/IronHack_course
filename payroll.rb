

class Playrollcalculator
	def initialize (file_reader)
		@file_reader = Filereader.new(file_reader)
	end	

	def calculate_payroll
		@file_reader.all_employees.each do |employee|
			puts employee.name + " " + employee.totalPayment().to_s
		end	
	end

end

class Filereader
	def initialize (file) 
		@file_reader = IO.read(file)
	end

	def all_employees
		employees = []		
		@file_reader.each_line do |line|
			employees.push(create_employee(line))
		end
		return employees
	end

	def create_employee(line)
		lineParts = line.split(' ')
		payment_method = lineParts[0]
			
			if payment_method == "Base"
				return Base.new(lineParts[1], lineParts[2])
			elsif payment_method == "Hour"
				return Hour.new(lineParts[1],lineParts[2], lineParts[3])
			else payment_method == "BasePlusHour"
				return BasePlusHour.new(lineParts[1],lineParts[2],lineParts[3], lineParts[4])
			end
	end

end

#objeto polimorfico

class Base
	attr_reader :name
	def initialize (name,s_base)
		@name = name
		@s_base = s_base
	end

	def totalPayment
		@s_base
	end
end

class Hour
	attr_reader :name
	def initialize (name,n_hour,s_hour)
		@name = name
		@n_hour = n_hour
		@s_hour = s_hour
	end

	def totalPayment
		@s_hour.to_i * @n_hour.to_i
	end
end

class BasePlusHour
	attr_reader :name
	def initialize (name,s_base, n_hour, s_hour)
		@name = name
		@s_base = s_base
		@s_hour = s_hour
		@n_hour = n_hour
	end

	def totalPayment
	 	@s_base.to_i + (@s_hour.to_i * @n_hour.to_i)
	end
end

#calls

payrolls = Playrollcalculator.new("payment.txt")

payrolls.calculate_payroll

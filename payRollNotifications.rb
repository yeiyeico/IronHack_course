

class Playrollcalculator
	def initialize (file_reader)
		@file_reader = Filereader.new(file_reader)
	end	

	def calculate_payroll
		@file_reader.all_employees.each do |employee|
			puts employee.name + " " + employee.totalPayment().to_s + " " + employee.contact
			Notificator.new.send_notificatior(employee)
		end
	end
end

class Notificator
	def send_notificatior (employee)
		if isTwitter(employee.contact)
			Twitter.new(employee.contact).send_notification_to employee.name
		elsif isSms(employee.contact)
			Sms.new(employee.contact).send_notification_to employee.name
		elsif isMail(employee.contact)
			Mail.new(employee.contact).send_notification_to employee.name
		end
	end

	def isTwitter(notification)
		notification[0] == "@"
	end

	def isSms(notification)
		notification[0] == "6"
	end

	def isMail(notification)
		notification.include?(".com")
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
				return Base.new(lineParts[1], lineParts[3], lineParts[2])
			elsif payment_method == "Hour"
				return Hour.new(lineParts[1], lineParts[3], lineParts[4], lineParts[2])
			else payment_method == "BasePlusHour"
				return BasePlusHour.new(lineParts[1], lineParts[3], lineParts[4], lineParts[5], lineParts[2])
			end
	end

end

#objeto polimorfico

class EmployeeGeneric
	
	attr_reader :name, :contact

	def initialize (name, contact)
		@name = name
		@contact = contact
	end
end

class Base < EmployeeGeneric
	
	def initialize (name,s_base,contact)
		super(name, contact)
		@s_base = s_base
	end

	def totalPayment
		@s_base
	end
end

class Hour < EmployeeGeneric
	
	def initialize (name,n_hour,s_hour,contact)
		super(name, contact)
		@n_hour = n_hour
		@s_hour = s_hour
	end

	def totalPayment
		@s_hour.to_i * @n_hour.to_i
	end
end

class BasePlusHour < EmployeeGeneric
	def initialize (name,s_base, n_hour, s_hour, contact)
		super(name, contact)
		@s_base = s_base
		@s_hour = s_hour
		@n_hour = n_hour
	end

	def totalPayment
	 	@s_base.to_i + (@s_hour.to_i * @n_hour.to_i)
	end
end

#notification objects

class Twitter
	def initialize (twitter)
		@twitter = twitter
	end

	def send_notification_to name
		puts "enviando a twitter al usuario "+ name
	end
end

class Mail
	def initialize (mail)
		@mail = mail
	end

	def send_notification_to name
		puts "enviando a mail al usuario " + name
	end
end

class Sms
	def initialize (sms)
		@sms = sms
	end

	def send_notification_to name
		puts "enviando a sms al usuario " + name
	end
end


#calls

payrolls = Playrollcalculator.new("payrollNotifications.txt")

payrolls.calculate_payroll

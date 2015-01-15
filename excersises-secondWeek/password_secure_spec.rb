require "pry"

class PasswordChecker
	def initialize (mailer)
		@mailer = mailer
	end

	def check_password (email, password)
		#binding.pry

		if password_size(password) || password_letter_num_include?(password)
			@mailer.send_mail
		# elsif password_email_content(password)
		# 	@mailer.send_mail 
		end		
	end

	def password_size(password)
		password.size < 7
	end

	def password_letter_num_include?(password)
		!password.match(/[a-z0-9]/)
	end

	# def password_letter_num_sym(password)
	# 	@password.match(/[a-zA-Z0-9_\.-$]/)
	# end

	# def password_email_content(password)
	# 	email_without_com = @email.gsub(".com","")
	# 	splitted_email= email_without_com.split("@")
		
	# 	@password.include?(splitted_email[0])
		
	# 	@password.include?(splitted_email[1])
	# end
end


RSpec.describe "String calculator" do
	
	it "empty password" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		#password_cheker = PasswordChecker.new(mailer)
		PasswordChecker.new(mailer).check_password("email@skjdjs.com"," ")
	end

	it "password < 7" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		#password_cheker = PasswordChecker.new(mailer)
		PasswordChecker.new(mailer).check_password("email@skjdjs.com","dsl")
	end

	it "password > 7" do
		mailer = double("Mailer")
		expect(mailer).not_to receive(:send_mail)
		#password_cheker = PasswordChecker.new(mailer)
		PasswordChecker.new(mailer).check_password("email@skjdjs.com","dslsjdksd7ew")
	end

	it "password not include a number" do
		mailer = double("Mailer")
		expect(mailer).to receive(:send_mail)
		#password_cheker = PasswordChecker.new(mailer)
		PasswordChecker.new(mailer).check_password("email@skjdjs.com","$-")
	end

	it "password include a number" do
		mailer = double("Mailer")
		expect(mailer).not_to receive(:send_mail)
		#password_cheker = PasswordChecker.new(mailer)
		PasswordChecker.new(mailer).check_password("email@skjdjs.com","44444444444")
	end

end
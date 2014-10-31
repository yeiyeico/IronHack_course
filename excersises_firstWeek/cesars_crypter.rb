class Caesar
	
	def encrypt(message, shift=3)
		new_message = ""
		(0..message.size-1).each do |i| 
			new_message += (message[i].ord + shift).chr
		end
	    new_message
	end

	def newEncrypt(message,shift=3)
		new_message = ""
		message.each_char do |i|
			new_message += (i.ord + shift).chr	
		end
		new_message
	end
end

call_caesar = Caesar.new

puts call_caesar.encrypt("iñaki", 7)

puts call_caesar.encrypt("hola", 7)



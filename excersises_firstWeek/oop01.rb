class Box
	
	def initialize (w,h)
		@width = w
		@height = h
	end

	def calculate_area
		@width * @height
	end

	attr_accesor:width
end
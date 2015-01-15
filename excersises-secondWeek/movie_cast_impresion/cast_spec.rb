require "pry"

class MovieCast
	def initialize(role)
		@role =  role
		@all_roles = ["Director", "Star", "Cast", "Writer", "Producer"]
		@coolness_factor = 0
	end

	def coolness_factor			
		@role.each do |worker_rol|	

			if @all_roles.find{|x| x == worker_rol}
				@add_to_coolness_factor = roles_plus_one
			elsif @all_roles.find{|x| x == "Director"}
				@add_to_coolness_factor = roles_plus_two
			elsif
				@add_to_coolness_factor = @coolness_factor * 2
			end
		end	
		return @add_to_coolness_factor

	end


	def roles_plus_one
		roles_plus_one = ["Star", "Cast", "Producer"]
		
		@role.each do |worker|
			if roles_plus_one.find{|x| x == worker}
				@coolness_factor = 1
			end
		end
		
		return @coolness_factor
	end


	def roles_plus_two
		roles_plus_two = ["Director"]
		
		@role.each do |worker|
			if roles_plus_two.find{|x| x == worker}
				@coolness_factor = 2
			end
		end

		return @coolness_factor
	end

end


RSpec.describe "movies cast impressions test" do
	let(:worldCells){WorldCells.new}

 	it "role is a Star add to coolness_factor 1" do
		expect(MovieCast.new(["Star"]).coolness_factor).to eq(1)
	end

	it "role is a Director add to coolness_factor 2" do
		expect(MovieCast.new(["Director"]).coolness_factor).to eq(2)
	end

	it "role is somebody add to coolness_factor * 2" do
		expect(MovieCast.new(["Jessica"]).coolness_factor).to eq(0)
	end

	it "role is Writer coolness_factor no add any value " do
		expect(MovieCast.new(["Writer"]).coolness_factor).to eq(0)
	end

	it "two diferent roles likes the movie " do
		expect(MovieCast.new(["Producer", "Writer"]).coolness_factor).to eq(1)
	end
end 
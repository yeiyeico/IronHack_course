require "pry"

class GameofLife
    
    def cells_status(total_neighbours_alive, status)

  		 @total_neighbours_alive = total_neighbours_alive
  		 @status = status

  		 if @status == :alive
  		 	if (@total_neighbours_alive < 2 || @total_neighbours_alive > 3) 
  		 		return :died
  		 	elsif @total_neighbours_alive >= 2 || @total_neighbours_alive <= 3 
  		 		return :alive
  		 	end
		else
			if @total_neighbours_alive == 3
				return :alive
			else
				return :died
			end	
  		end
    end
end

class WorldCells

	def create_cells(current_cell_status)
		i = 0 
		current_cell_status.map do |cells_status|
			neighbors = 0
			if i>0 && current_cell_status[i-1]
				neighbors += 1
			end
			if i<current_cell_status.length && current_cell_status[i+1]
				neighbors += 1
			end
			i += 1
			GameofLife.new.cells_status(neighbors,cells_status)
		end 
	end
end

# codigo para testear el codigo con RSpec
RSpec.describe "Game of life" do
	
	let(:gameoflife){GameofLife.new}
	let(:worldCells){WorldCells.new}

    it "alive cell die with 0 neighbours" do
		expect(gameoflife.cells_status(0, :died)).to eq(:died)
	end
    
    it "alive cell die with 2 neighbours" do
		expect(gameoflife.cells_status(1, :alive)).to eq(:died)
	end 

    it "alive cell alive with 2 or 3 neighbours" do
		expect(gameoflife.cells_status(2, :alive)).to eq(:alive)
	end
    
    it "alive cell dies with more than 3 neighbours" do
		expect(gameoflife.cells_status(4, :alive)).to eq(:died)
	end
    
     it "dead cell equal to 3 alive" do
		expect(gameoflife.cells_status(3,:died)).to eq(:alive)
	end

	# testeo de celulas creadas
	it "one dead cell" do
		expect(worldCells.create_cells([:died])).to eq([:died])
	end

	it "create cell one alive" do
		expect(worldCells.create_cells([:alive])).to eq ([:died])
	end

	it "create cell one alive" do
		expect(worldCells.create_cells([:alive,:died])).to eq ([:died,:died])
	end

	it "create cell one alive" do
		expect(worldCells.create_cells([:alive,:alive,:alive])).to eq ([:died,:alive,:died])
	end
end




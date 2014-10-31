
require "./tablePrices.rb"
require "./calculateDiscount.rb"

class ShoppingCart
	def initialize
		@table_prices = TablePrices.new
		@item_list = []
		discount_list = [
			DiscountApple.new(@table_prices.cost_item(:apples)), 
			DiscountOrange.new(@table_prices.cost_item(:oranges)), 
			DiscountGrapes.new(@table_prices.cost_item(:banana))
		]
		@discount = CalculateDiscount.new(@item_list, @table_prices, discount_list)
		@total_cost = 0
	end

	def add (additem)
		@item_list.push(additem)
		#puts @item_list.to_s
	end

	def total_cost
		
		total_discount = @discount.apply_discounts
		@item_list.each do |item|
			@total_cost = @total_cost + @table_prices.cost_item(item)
		end
		puts "Total = #{@total_cost}"
		puts "Total Discount = #{total_discount}"
		puts "Final payment = #{@total_cost - total_discount}"
	end

end



cart = ShoppingCart.new

cart.add :apples
cart.add :apples
cart.add :apples
cart.add :apples
cart.add :banana
cart.add :watermelon

cart.total_cost


#require_relative './code_calculator'
require 'sinatra'
require "pry"

set :port, 3000
set :bind, '0.0.0.0'

require "sinatra/reloader" if development?


get '/' do
    erb :index
end

get '/counting' do 
	@counting = CoutingNumbers.new.array_nums
	erb :counting
end

post '/result' do
    operator = params[:select_operator]
    first_number = params[:first_number].to_i
    second_number = params[:second_number].to_i
    #binding.pry
    @result = OnlineCalculator.new.operators(first_number,operator,second_number)
    erb :result
end




class OnlineCalculator
   
   def operators (first_number, operator, second_number)
   		if operator == "+"
   			result_equation = first_number + second_number
   		elsif operator == "-"
   			result_equation = first_number - second_number
   		elsif operator == "*"
   			result_equation = first_number * second_number
   		elsif operator == "/"
   			result_equation = first_number / second_number
   		end
   			return result_equation
   end

end

class CoutingNumbers
	def array_nums
		(1..200).to_a
	end
end

require 'sinatra'
require "sinatra/reloader" if development?
require 'artii'

set :port, 3000
set :bind, '0.0.0.0'

get '/ascii/:convert_text' do
	item_convert_text = params[:convert_text]
	@word = CodeAscci.new.convert_to_artii(item_convert_text)
	erb :index 
end
 
class CodeAscci
	def convert_to_artii(word)
		a = Artii::Base.new :font => 'slant'
		a.asciify(word)
	end

end
require 'sinatra'
require 'sinatra/reloader' if development?
require './library/library'


set :port, 3000
set :bind, '0.0.0.0'

get '/' do
	erb :index
end

post '/posters' do

	searching_movie_word = params[:word]
	@movies_party = MoviesParty.new(ImdbAdapter.new,searching_movie_word)
	@posters = @movies_party.movie_poster
	# @movie_year = @new_object_movie.search_year(searching_movie_word)
	@random_year = @movies_party.random_year
	@random_poster =@movies_party.random_poster

	erb :posters
end



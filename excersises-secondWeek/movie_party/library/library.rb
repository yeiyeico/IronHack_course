
# creacion de adaptador
require 'pry'
require 'imdb'

class ImdbAdapter
	def call_search_imdb(movie)
		@movie_list = Imdb::Search.new(movie).movies
		@shortlist_movies = @movie_list.take(9)
	end	

	def poster	
		@shortlist_movies.map do |movie|
			movie.poster
		end		
	end

	def year_rand
		random_number = rand(@shortlist_movies.size)
		year_random_movie = @shortlist_movies[random_number].year
		@poster_random_movie = @shortlist_movies[random_number].poster
		return year_random_movie
	end

	def poster_rand
		@poster_random_movie
	end
	
end


class MoviesParty
	def initialize(movie_source, movie)
		@movie_source = movie_source
		@movie_source.call_search_imdb(movie)
	end

	def movie_poster
		@movie_source.poster
	end

	def random_year
		@movie_source.year_rand
	end

	def random_poster
		@movie_source.poster_rand
	end 
		
end


class MoviesController < ApplicationController
  require "themoviedb-api"
  # require 'rubygems'
  # require 'ruby-tmdb'
  Tmdb::Api.language("ja")
  Tmdb::Api.key()
#   # setup your API key
# Tmdb.api_key = "t478f8de5776c799de5a"

# # setup your default language
# Tmdb.default_language = "en"

# @movie = TmdbMovie.find(:title => "Iron Man", :limit => 1)
# # => <OpenStruct>

# @movie.name
# # => "Iron Man"

# @movie.posters.length
# # => 12

# @movie.posters.first.data
# # => [binary blob representing JPEG]
  
  
  
  def search
    
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    
    
    
    # movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    
    # @body = Review.new(title: movieinfo['table']['title'],movie_id: @movie)
    # @body.save


  end
end

class MoviesController < ApplicationController
  require "themoviedb-api"
  # require 'rubygems'
  # require 'ruby-tmdb'
  Tmdb::Api.language("ja")
  Tmdb::Api.key("")
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
  
  def showing
    @movies = Movie.all
    @movie = Tmdb::Movie.detail(params[:id])
    @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    @movie = Movie.new(name: @movieinfo['table']['title'],intro: @movieinfo["table"]["poster_path"])
    @movie.save
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.save
    redirect_to "/reviews/#{@review.id}"
  end
   
   
   def testt
   end
  
  def search
    
  end

  def show
     @movies = Movie.all
    @movie = Tmdb::Movie.detail(params[:id])
    @review = Review.new
    # @review.save
    
    @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    # @movie = Movie.new(name: @movieinfo['table']['title'],intro: @movieinfo["table"]["poster_path"])
    # @movies.save
  end
  def review_params
    params.require(:review).permit(:title,:body).merge(movie_id: @movie)
  end
end

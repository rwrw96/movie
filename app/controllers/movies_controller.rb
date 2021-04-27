class MoviesController < ApplicationController
  before_action :move_to_signed_in
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

def show 
  @reviews = Review.all
  @review = Review.new
  @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  
  @movie = Movie.new(title: @movieinfo["table"]["title"])
  array = []
  Movie.all.each do |m|
    array << m.title
  end
   if @movieinfo["table"]["title"].in?(array)
    return
  else
    @movie.save
  end

end

  
  
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  
    
  end
end

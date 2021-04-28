class MoviesController < ApplicationController
  before_action :move_to_signed_in
  require "themoviedb-api"
  # require 'rubygems'
  # require 'ruby-tmdb'
  Tmdb::Api.language("ja")
  Tmdb::Api.key("f666fc01f99324fbc4beea6ae1f0e427")
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


def index
  
end

def show 
  @reviews = Review.all
  @review = Review.new
  @movieinfo = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
  
  @movie = Movie.new(title: @movieinfo["table"]["title"],
                    release_date: @movieinfo["table"]["release_date"],
                    overview: @movieinfo["table"]["overview"],
                    poster_path: @movieinfo["table"]["poster_path"],
                    tmdb: @movieinfo["table"]["id"])
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

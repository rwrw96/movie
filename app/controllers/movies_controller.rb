class MoviesController < ApplicationController
  require "themoviedb-api"
  require 'rubygems'
  # require 'ruby-tmdb'
  Tmdb::Api.key("f666fc01f99324fbc4beea6ae1f0e427")
  Tmdb::Api.language("ja")
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
  end
end

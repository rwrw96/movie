class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("ご自身のAPI Key")
  Tmdb::Api.language("ja")
  def search
  end

  def show
  end
end

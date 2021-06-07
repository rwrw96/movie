class LikesController < ApplicationController
  
  def create
    @movie = Movie.find(params[:id])
    Like.create(user_id: current_user.id, movie_id: @movie.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @movie = Movie.find(params[:id])
    Like.find_by(user_id: current_user.id, movie_id: @movie.id).destroy
    redirect_back(fallback_location: root_path)
  end
end

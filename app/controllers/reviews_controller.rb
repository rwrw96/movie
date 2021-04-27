class ReviewsController < ApplicationController
  
  
def show
  @review = Review.find(params[:id])
end

def create
  @movie = Movie.find_by(params[:tmdb])
  @review = @movie.reviews.new(review_params)
  @review.user_id = current_user.id
  @review.save!
  
  redirect_to review_path(@review)
end

private
  def review_params
    params.require(:review).permit(:title,:body,:rate)
  end
end

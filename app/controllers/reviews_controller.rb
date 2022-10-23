
class ReviewsController < ApplicationController
  def create
    @room = Room.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.room = @room
    if @review.save
      redirect_to room

    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end

class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.create(review_params)
    redirect_to '/'
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end

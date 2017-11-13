class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.create(review_params)
    redirect_to '/'
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end

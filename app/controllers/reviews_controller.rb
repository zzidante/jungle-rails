class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.create(review_params)
    @reviews.user_id = current_user.id    
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :user_id)
  end

end

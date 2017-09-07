class ReviewsController < ApplicationController
  def create
    @review = Review.new(comment: params[:review][:comment])
    @product = Product.find(params[:product_id])
    @review.product = @product

    @review.save
      redirect_to product_path(@product)

  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])

    @review.comment = params[:review][:comment]

    if @review.save
      redirect_to product_path(@product)
      flash[:notice] = "Review edited!"
    else
      render product_path(@product)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_path(params[:product_id])
    flash[:notice] = "Product deleted!"
  end
end

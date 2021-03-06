class ProductsController < ApplicationController

  def index

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]


    if @product.save
      redirect_to product_path(@product)
      flash[:notice] = "Product created!"
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
    product = @product
    @review = Review.new
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]


    if @product.save
      redirect_to product_path(@product)
      flash[:notice] = "Product updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
    flash[:notice] = "Product deleted!"
  end

  private def product_params
    params.require(:product).permit(:name, :description,:price_in_cents)
  end

end

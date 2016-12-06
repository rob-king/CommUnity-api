class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products, include: :comments
  end

  def show
    @product = Product.find(params[:id])
    render json: @product, include: :comments
  end

  def update
    @product =  Product.find(params[:id])
    if @product.update!(product_params)
      render json: @product, location: @product, include: :comments
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product =  Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :imageURL, :votes)
  end
end

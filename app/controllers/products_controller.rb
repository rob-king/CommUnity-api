class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
<<<<<<< HEAD
    render json: @product
=======
    render json: @product, include: :comments
>>>>>>> 037a13ba51179ebe8faa8d40b9e1dc2ce972d6eb
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product =  Product.find(params[:id])
    if @product.update!(product_params)
      render json: @product, location: @product
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

<<<<<<< HEAD
def product_params
  params.require(:product).permit(:name, :description, :imageURL)
=======
  def product_params
    params.require(:product).permit(:name, :description, :imageURL)
  end
>>>>>>> 037a13ba51179ebe8faa8d40b9e1dc2ce972d6eb
end

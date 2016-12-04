class ProductsController < ApplicationController

  def index
    @products = Product.all
    respond_to do |format|
      format.json {render json: @products}
    end
  end

def show
  @product = Product.find(params[:id])
  respond_to do |format|
    format.json {render json: @product, include: :comments}
  end
end

def new
  @product = Product.new
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product =  Product.find(params[:id])
  respond_to do |format|
    if @product.update!(product_params)
      format.json {render json: @product, location: @product}
    else
      format.json {render json: @product.errors, status: :unprocessable_entity}
    end
  end
end

def create
  @product = Product.new(product_params)
  respond_to do |format|
    if @product.save!
      format.json {render json: @product, status: :created, location: @product}
    else
      format.json {render json: @product.errors, status: :unprocessable_entity}
    end
  end
end

def destroy
  @product =  Product.find(params[:id])
  @product.destroy
end


private

def product_params
  params.require(:product).permit(:name, :description, :imageURL)
  end
end

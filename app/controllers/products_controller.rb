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
    format.json {render json: @product}
  end
end

  def new
  @product = Product.new
end

  def edit
end

def create
  @product = Product.new(product_params)
end

def destroy
  @product.destroy
  respond_to do |format|
    format.html { redirect_to product_url, notice: 'Product was successfully destroyed. ' }
  end
end


private
  def set_product
    @product = Product.find(params[:id])
  end

def product_params
  params.require(:product).permit(:name, :description)
  end
end

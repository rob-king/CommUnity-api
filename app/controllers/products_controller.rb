class ProductsController < ApplicationController

def index
    @products = Product.all
end

def show
  @product = Product.find(params[:product_id])
  @comment = Comment.find(params[:id])
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


private
  def set_product
    @product = Product.find(params[:id])
  end

def product_params
  params.require(:product).permit(:name, :description)
  end
end
end

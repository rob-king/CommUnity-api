class TagsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    render json: @product.categories.pluck(:name)
  end
end

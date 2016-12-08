class TagsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    render json: @product.categories.pluck(:name)
  end

  def update
    @product = Product.find(params[:product_id])
    @product.update_tags(params[:tags])
    render json: @product, include: [:comments, :categories]
  end

end

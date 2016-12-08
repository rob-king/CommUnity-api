class TagsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    render json: @product.categories.pluck(:name)
  end

  def create
    @product = Product.find[:product_id]
    @tag_strings = params[:tags]
  end

  def update
    @product = Product.find(params[:product_id])
    tag_strings = params[:tags]
    render json: @product, include: [:comments, :categories]
  end

end

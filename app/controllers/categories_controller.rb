class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories.pluck(:name)
  end
end

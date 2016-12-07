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
    current_tags = @product.categories.pluck(:name)
    tag_strings = params[:tags]

    tags_to_add = tag_strings - current_tags
    tags_to_remove = current_tags - tag_strings

    tags_to_add.each {|tag|
      create_tag @product, tag.downcase
    }

    tags_to_remove.each{ |tag|
      remove_tag @product, tag.downcase
    }

    render json: @product, include: [:comments, :categories]
  end

  private

  def create_tag(product, tag_string)
    category = Category.find_by(name: tag_string)
    if category
      product.tags.create(category: category) unless product.categories.pluck(:name).include? tag_string
    else
      product.categories.create(name: tag_string)
    end
  end

  def remove_tag(product, tag_string)
    category = Category.find_by(name: tag_string)
    tag = Tag.find_by(product: product, category: category)
    tag.destroy
  end

end

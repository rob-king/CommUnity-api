class CommentController < ApplicationController

  def show
    @comment = Comment.find(params[:product_id])
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build
  end

  def create
    @product = Product.find(params[:product_id])
    @comment =@product.comments.create(comment_params)
    redirect_to @product
    end
  end

class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)

    if @comment.save!
      render json: @product, include: [:comments, :categories],  status: :created, location: @product
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.product = @product

    if @comment.update!(comment_params)
      render json: @product, include: [:comments, :categories]
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @product, include: [:comments, :categories]

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end

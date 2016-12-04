class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)

    if @comment.save!
      render json: @product, include: :comments,  status: :created, location: @product
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.product = @product

    if @comment.update!(comment_params)
      render json: @product, include: :comments
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end

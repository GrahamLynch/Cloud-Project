require 'displayer'
require 'Eventlistener'
require 'commentcheck'
class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(params[:comment].permit(:name,:body,:score))
    redirect_to product_path(@product)
    words =  CommentCheck.instance.load_file(Rails.root.join('lib/words.json'))
    review = @comment.body
    user = current_user.email
    score = CommentCheck.instance.call(review, words)
    @comment.score = score
    @comment.name = current_user.email
    @comment.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

  #def create
    #@product = Product.find(params[:product_id])
    #redirect_to product_path(@product)
    #comment = Comment.last.body
    #words =  CommentCheck.instance.load_file(Rails.root.join('lib/words.json'))
    #review = "Not good"
    #user = current_user.email
    #score = CommentCheck.instance.call(comment.to_s, words)
    #@comment = @product.comments.build(name: user, body: review, score: score)
    #@comment.save
  #end

end

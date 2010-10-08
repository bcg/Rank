class CommentsController < ApplicationController
  before_filter :login_required
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
    else
      render :text => "", :status => 500
    end
  end
end

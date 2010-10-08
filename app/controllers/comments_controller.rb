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

  def vote
    @comment = Comment.find(params[:id])
    unless Vote.exists?(:voter_id => current_user.id, :comment_id => @comment.id)
      vote = Vote.new
      vote.voter = current_user
      vote.comment = @comment
      vote.save
    end
  end

end

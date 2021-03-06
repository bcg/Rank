class CommentsController < ApplicationController
  before_filter :login_required
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.post = @post
    @comment.author = current_user
    @comment.account = @current_account
    @comment.save
  end
  
  def reply
    orig_comment = Comment.find(params[:id])
    orig_post = orig_comment.post
    
    @comment = Comment.new(params[:comment])
    @comment.post = orig_post
    @comment.author = current_user
    @comment.parent = orig_comment
    @comment.account = @current_account
    @comment.save
  end

  def upvote
    @comment = Comment.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :comment_id => @comment.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.comment = @comment
      vote.score = 1
      vote.save
    elsif prev and prev.score == -1
      prev.score = 1
      prev.save
    end
    @comment.reload
  end

  def downvote
    @comment = Comment.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :comment_id => @comment.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.comment = @comment
      vote.score = -1
      vote.save
    elsif prev and prev.score == 1
      prev.score = -1
      prev.save
    end
    @comment.reload
  end

end

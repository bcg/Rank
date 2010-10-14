class PostsController < ApplicationController
  before_filter :login_required
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @bucket = Bucket.find(params[:bucket_id]) if params[:bucket_id]
    @buckets = Bucket.find(:all, :order => "name ASC")
    @post = Post.new
    @post.bucket = @bucket
  end
  
  def create
    @buckets = Bucket.find(:all, :order => "name ASC")
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.account = @current_account
    if @post.save
      flash[:notice] = "Successfully saved your post to #{@post.bucket.name}."
      redirect_to @post
    else
      render :action => :new
    end
  end

  def upvote
    @post = Post.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :post_id => @post.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.post = @post
      vote.score = 1
      vote.save
    elsif prev and prev.score == -1
      prev.score = 1
      prev.save
    end
    @post.reload
  end

  def downvote
    @post = Post.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :post_id => @post.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.post = @post
      vote.score = -1
      vote.save
    elsif prev and prev.score == 1
      prev.score = -1
      prev.save
    end
    @post.reload
  end
  
end

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
    @post = Post.new(params[:post])
    @post.author = current_user
    if @post.save
      flash[:notice] = "Successfully saved your post to #{@post.bucket.name}."
      redirect_to @post
    else
      render :action => :new
    end
  end

  def vote
    @post = Post.find(params[:id])
    unless Vote.exists?({:voter_id => current_user.id, :post_id => @post.id})
      vote = Vote.new
      vote.voter = current_user
      vote.post = @post
      vote.save
    end
  end
  
end

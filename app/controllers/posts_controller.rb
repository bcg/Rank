class PostsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create, :vote ]
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @bucket = Bucket.find(params[:bucket_id])
    @post = Post.new
  end
  
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @post = Post.new(params[:post])
    @post.bucket = @bucket
    @post.author = current_user
    if @post.save
      flash[:notice] = "Successfully saved your post to #{@bucket.name}."
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

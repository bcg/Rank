class PostsController < ApplicationController
  before_filter :login_required
  
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
    @post.author = current_user
    if @post.save
      flash[:notice] = "Successfully saved your post to #{@bucket.name}."
      redirect_to @post
    else
      render :action => :new
    end
  end
  
end

class BucketsController < ApplicationController
  before_filter :login_required

  def show
    @bucket = Bucket.find(params[:id])
    @posts = Post.find(:all, :conditions => { :bucket_id => @bucket.id }, :order => "created_at DESC")
  end
  
  def new
    @bucket = Bucket.new
  end
  
  def create
    @bucket = Bucket.new(params[:bucket])
    @bucket.owner = current_user
    if @bucket.save
      flash[:notice] = "Your new bucket has been created."
      redirect_to @bucket
    else
      render :action => :new
    end
  end
  
end

class BucketsController < ApplicationController
  before_filter :login_required

  def index
    @buckets = Bucket.find(:all)
  end

  def show
    @buckets = Bucket.find(:all, :order => "name ASC")
    @bucket = Bucket.find(params[:id])
    @posts = Post.find(:all, :conditions => { :bucket_id => @bucket.id }, :order => "created_at DESC")
  end
  
  def new
    @bucket = Bucket.new
  end
  
  def create
    @bucket = Bucket.new(params[:bucket])
    @bucket.owner = current_user
    @bucket.account = @current_account
    if @bucket.save
      flash[:notice] = "Your new category has been created."
      redirect_to @bucket
    else
      render :action => :new
    end
  end
  
  def join
    @bucket = Bucket.find(params[:id])
    unless current_user.member_of?(@bucket)
      permission = BucketPermission.new
      permission.user = current_user
      permission.bucket = @bucket
      if permission.save
        flash[:notice] = "You are now subscribed to #{@bucket.name}. Posts from this category will appear in your dashboard."
        redirect_to @bucket
      else
        flash[:error] = "Sorry, you cannot subscribe to #{@bucket.name} at this time."
      end
    end
    redirect_to @bucket
  end
  
end

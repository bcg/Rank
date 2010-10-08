class BucketsController < ApplicationController
  before_filter :login_required

  def show
    @bucket = Bucket.find(params[:id])
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

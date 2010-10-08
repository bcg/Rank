class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @buckets = Bucket.all(:order => "name ASC")
    @posts = Post.find(:all, :order => "created_at DESC")
  end
end

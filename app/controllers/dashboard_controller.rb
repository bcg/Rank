class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @buckets = current_user.buckets
    @posts = Post.find(:all, :order => "created_at DESC")
  end
end

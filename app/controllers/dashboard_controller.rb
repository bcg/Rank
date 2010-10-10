class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @buckets = Bucket.all(:order => "name ASC")
    @posts = Post.find(:all, :order => "created_at DESC")
  end
  
  def activity
    @buckets = Bucket.all(:order => "name ASC")
    @posts = Post.find(:all, :order => "last_activity_at DESC")
  end
  
  def comment_activity
    @buckets = Bucket.all(:order => "name ASC")
    @comments = Comment.find(:all, :order => "created_at DESC")
  end
end

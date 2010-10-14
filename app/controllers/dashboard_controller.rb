class DashboardController < ApplicationController
  before_filter :login_required_if_private
  
  def index
    @buckets = current_account.buckets.find(:all, :order => "name ASC")
    @posts = current_account.posts.find(:all, :order => "created_at DESC")
  end
  
  def activity
    @buckets = current_account.buckets.find(:all, :order => "name ASC")
    @posts = current_account.posts.find(:all, :order => "last_activity_at DESC")
  end
  
  def comment_activity
    @buckets = current_account.buckets.find(:all, :order => "name ASC")
    @comments = current_account.comments.find(:all, :order => "created_at DESC")
  end
end

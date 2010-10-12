class BookmarkletController < ApplicationController
  layout false
  def single_access_allowed?
    ["show","new","create"].include?(action_name)
  end
  before_filter :login_required
  
  def show
    @post = Post.new
    title = params[:title] ? params[:title].gsub(/[\n|\t]/, " ") : ''
    @post.title = title.gsub(/[\s]+/, " ").strip
    @post.url = params[:url]
  end

  def new
    @buckets = Bucket.find(:all, :order => "name ASC")
    @post = Post.new
    title = params[:title] ? params[:title].gsub(/[\n|\t]/, " ") : ''
    @post.title = title.gsub(/[\s]+/, " ").strip
    @post.url = params[:url]
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.save
    current_user.update_attribute(:bookmarklet_installed, true)
  rescue
  end
  
  def install_flag
    current_user.update_attribute(:bookmarklet_installed, true)
  end

end

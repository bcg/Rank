class PostsController < ApplicationController
  before_filter :login_required_if_private, :only => [ :show ]
  before_filter :login_required, :only => [ :new, :create, :edit, :update, :destroy, :upvote, :downvote ]
  
  def show
    @post = current_account.posts.find(params[:id])
  end
  
  def new
    @bucket = current_account.buckets.find(params[:bucket_id]) if params[:bucket_id]
    @buckets = current_account.buckets.find(:all, :order => "name ASC")
    @post = Post.new
    @post.bucket = @bucket
  end
  
  def create
    @buckets = current_account.buckets.find(:all, :order => "name ASC")
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.account = current_account
    if @post.save
      flash[:notice] = "Successfully saved your post to #{@post.bucket.name}."
      redirect_to @post
    else
      render :action => :new
    end
  end

  def upvote
    @post = current_account.posts.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :post_id => @post.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.post = @post
      vote.score = 1
      vote.save
    elsif prev and prev.score == -1
      prev.score = 1
      prev.save
    end
    @post.reload
  end

  def downvote
    @post = current_account.posts.find(params[:id])
    prev = Vote.find(:first, :conditions => {:voter_id => current_user.id, :post_id => @post.id})
    if prev.nil?
      vote = Vote.new
      vote.voter = current_user
      vote.post = @post
      vote.score = -1
      vote.save
    elsif prev and prev.score == 1
      prev.score = -1
      prev.save
    end
    @post.reload
  end
  
end

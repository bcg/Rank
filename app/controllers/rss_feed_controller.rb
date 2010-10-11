class RssFeedController < ApplicationController
  layout false
  def single_access_allowed?
    ["index"].include?(action_name)
  end
  before_filter :login_required

  def index
    @posts = Post.find(:all, :order => "created_at DESC", :limit => 20)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

end

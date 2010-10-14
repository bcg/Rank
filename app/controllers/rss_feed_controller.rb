class RssFeedController < ApplicationController
  layout false
  def single_access_allowed?
    ["index"].include?(action_name)
  end

  before_filter :login_required_if_private
  

  def index
    @posts = current_account.posts.find(:all, :order => "created_at DESC", :limit => 20)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

end

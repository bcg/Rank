require 'test_helper'

class RssFeedControllerTest < ActionController::TestCase
  def setup
    @site_config = Factory(:site_configuration)
    @user = Factory(:user)
  end
  
  test "rss feed with no items" do
    assert_equal 0, Post.count
    
    get 'index', { :format => "xml", :token => @user.single_access_token }, {}
    assert_response :success
    assert_select "item", 0
  end
  
  test "rss feed with posts" do
    @post = Factory(:post)
    get 'index',  { :format => "xml", :token => @user.single_access_token }, {}
    assert_response :success
    assert_select "item", 1
  end
  
end

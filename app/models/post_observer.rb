class PostObserver < ActiveRecord::Observer
  observe :post
  
  def after_create(post)
    post.last_activity_at = post.created_at
    post.save
  end

end

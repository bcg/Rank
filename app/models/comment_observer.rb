class CommentObserver < ActiveRecord::Observer
  observe :comment
  
  def after_create(comment)
    comment.post.last_activity_at = comment.created_at
    comment.post.save
  end
end

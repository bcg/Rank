class VoteCounterObserver < ActiveRecord::Observer
  observe :vote
  
  def after_create(vote)
    if vote.post
      post = vote.post
      post.score_counter = 0 if post.score_counter.nil?
      post.score_counter += vote.score
      post.save
    elsif vote.comment
      comment = vote.comment
      comment.score_counter = 0 if comment.score_counter.nil?
      comment.score_counter += vote.score
      comment.save
    end
  end
  
  def after_update(vote)
    if vote.post
      post = vote.post
      post.score_counter += (vote.score * 2)
      post.save
    elsif vote.comment
      comment = vote.comment
      comment.score_counter += (vote.score * 2)
      comment.save
    end
  end
  
end

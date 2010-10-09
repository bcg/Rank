namespace :orgg3 do
  desc "Recalculate all the scores for posts and votes"
  task :recalculate_scores => :environment do
    Post.all do |post|
      post.score_counter = Vote.sum('score', :post_id => post.id)
      post.save!
    end
    
    Comment.all do |comment|
      comment.score_counter = Vote.sum('score', :comment_id => comment.id)
      comment.save!
    end
  end
end
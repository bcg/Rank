namespace :orgg3 do
  desc "Recalculate all the scores for posts and votes"
  task :recalculate_scores => :environment do
    Post.all do |post|
      post.score_counter = Vote.sum(:post_id => post)
      post.save!
    end
    
    Comment.all do |comment|
      comment.score_counter = Vote.sum(:comment_id => comment)
      comment.save!
    end
  end
end
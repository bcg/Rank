namespace :orgg3 do
  desc "Update last activity at"
  task :last_activity_update => :environment do
    logger = Rails.logger
    logger.info("# of posts: #{Post.count}")
    posts = Post.find(:all)
    for post in posts
      if post.comments.empty?
        logger.info("Post has no comments")
        post.last_activity_at = post.created_at 
      else
        logger.info("Post has comments")
        post.last_activity_at = post.comments.find(:first, :order => "created_at DESC").created_at
      end
      post.save!
    end
  end
end
namespace :orgg3 do
  desc "Update last activity at"
  task :last_activity_update => :environment do
    Post.all do |post|
      if post.comments.empty?
        post.last_activity_at = post.comments.find(:first, :order => "created_at DESC").created_at
      end
      post.last_activity_at = post.created_at if post.last_activity_at.nil?
      post.save!
    end
  end
end
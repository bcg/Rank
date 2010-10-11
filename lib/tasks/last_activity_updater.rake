namespace :orgg3 do
  desc "Update last activity at"
  task :last_activity_update => :environment do
    Post.all do |post|
      unless post.comments.empty?
        post.last_activity_at = post.comments.find(:first, :order => "created_at DESC").created_at
        post.save!
      end
    end
  end
end
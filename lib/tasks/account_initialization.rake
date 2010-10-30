namespace :rank do
  desc "One time task because first site was not multi-tenant"
  task :multitenantize => :environment do
    account = Account.new
    account.cname = "news.illinoislambdas.com"
    account.name = "XNN"
    account.save!

    buckets = Bucket.find(:all)
    buckets.each do |bucket|
      bucket.account = account
      bucket.save!
    end

    comments = Comment.find(:all)
    comments.each do |comment|
      comment.account = account
      comment.save!
    end
    
    posts = Post.find(:all)
    posts.each do |post|
      post.account = account
      post.save!
    end
        
    configs = SiteConfiguration.find(:all) do |config|
      config.account = account
      config.save!
    end
    
    users = User.find(:all)
    users.each do |user|
      user.account = account
      user.save!
    end
    
  end
  
end
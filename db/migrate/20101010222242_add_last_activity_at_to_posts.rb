class AddLastActivityAtToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :last_activity_at, :datetime
    posts = Post.all
    for post in posts
      post.last_activity_at = post.updated_at
      unless post.comments.empty?
        post.last_activity_at = post.comments.first.updated_at
      end
      post.save!
    end
  end

  def self.down
    remove_column :posts, :last_activity_at
  end
end

class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :bucket_id
      t.integer :author_id
      t.string :title, :length => 250
      t.string :url, :length => 250
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :post_id
      t.integer :comment_id
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :votes
  end
end

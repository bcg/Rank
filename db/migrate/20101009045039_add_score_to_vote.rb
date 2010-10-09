class AddScoreToVote < ActiveRecord::Migration
  def self.up
    add_column :votes, :score, :integer, :default => 1
    add_column :posts, :score_counter, :integer, :default => 0
    add_column :comments, :score_counter, :integer, :default => 0
  end

  def self.down
    remove_column :votes, :score
  end
end

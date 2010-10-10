class AddUserSingleAccessToken < ActiveRecord::Migration
  def self.up
    add_column :users, :single_access_token, :string
    
    User.all.each do |user|
      user.reset_single_access_token!
    end
  end

  def self.down
    remove_column :users, :single_access_token
  end
end

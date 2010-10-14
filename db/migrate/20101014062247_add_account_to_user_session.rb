class AddAccountToUserSession < ActiveRecord::Migration
  def self.up
    add_column :user_sessions, :account_id, :integer
  end

  def self.down
    remove_column :user_sessions, :account_id
  end
end

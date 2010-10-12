class AddBookmarkletInstalledFlag < ActiveRecord::Migration
  def self.up
    add_column :users, :bookmarklet_installed, :boolean, :default => false
  end

  def self.down
    remove_column :users, :bookmarklet_installed
  end
end

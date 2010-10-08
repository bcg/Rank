class CreateSiteConfigurations < ActiveRecord::Migration
  def self.up
    create_table :site_configurations do |t|
      t.string :display_name, :length => 40
      t.string :signup_password, :length => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :site_configurations
  end
end

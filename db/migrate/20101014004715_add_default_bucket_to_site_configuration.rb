class AddDefaultBucketToSiteConfiguration < ActiveRecord::Migration
  def self.up
    add_column :site_configurations, :default_bucket_id, :integer
  end

  def self.down
    remove_column :site_configurations, :default_bucket_id
  end
end

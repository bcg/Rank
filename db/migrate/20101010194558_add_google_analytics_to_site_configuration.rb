class AddGoogleAnalyticsToSiteConfiguration < ActiveRecord::Migration
  def self.up
    add_column :site_configurations, :google_analytics, :string
  end

  def self.down
    remove_column :site_configurations, :google_analytics
  end
end

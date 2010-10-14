class AlternateRssUrl < ActiveRecord::Migration
  def self.up
    add_column :site_configurations, :alternate_rss_url, :string
  end

  def self.down
    remove_column :site_configurations, :alternate_rss_url
  end
end

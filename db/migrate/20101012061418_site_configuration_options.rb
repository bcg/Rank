class SiteConfigurationOptions < ActiveRecord::Migration
  def self.up
    add_column :site_configurations, :short_name, :string, :length => 20
    add_column :site_configurations, :site_description, :text
    add_column :site_configurations, :home_url, :string
    add_column :site_configurations, :private_site, :boolean, :default => false
  end

  def self.down
    remove_column :site_configurations, :short_name
    remove_column :site_configurations, :site_description
    remove_column :site_configurations, :home_url
    remove_column :site_configurations, :private_site
  end
end

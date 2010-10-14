class SiteConfiguration < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account

  belongs_to :default_bucket, :class_name => "Bucket"
end

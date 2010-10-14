class SiteConfiguration < ActiveRecord::Base
  belongs_to :default_bucket, :class_name => "Bucket"
end

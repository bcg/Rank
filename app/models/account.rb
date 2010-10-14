class Account < ActiveRecord::Base
  has_one :site_configuration
  
  has_many :buckets, :order => "name ASC"
  has_many :posts
  has_many :comments
  has_many :users
end

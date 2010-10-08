class BucketPermissions < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  belongs_to :bucket
  validates_presence_of :bucket
end

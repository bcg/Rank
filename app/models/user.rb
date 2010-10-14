class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.validations_scope = :account_id
  end
  
  belongs_to :account
  validates_presence_of :account
  
  has_many :bucket_permissions, :class_name => "BucketPermissions", :dependent => :destroy
  
  def buckets
    buckets = Bucket.find(:all, :conditions => { :owner_id => self.id })
    for bucket in self.bucket_permissions
      buckets << bucket
    end
    buckets
  end
  
  def member_of?(bucket)
    return false if bucket.nil?
    return bucket.owner == self || bucket_permissions.exists?(:bucket_id => bucket.id)
  end
end

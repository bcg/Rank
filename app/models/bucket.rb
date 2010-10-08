class Bucket < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  validates_presence_of :owner
  validates :name, :length => { :minimum => 1, :maximum => 40 }
  
  trim_fields :name, :description
end

class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  belongs_to :post
  validates_presence_of :post
  
  validates :body, :length => { :minimum => 1 }
  
  trim_fields :body
end

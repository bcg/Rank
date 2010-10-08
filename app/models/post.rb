class Post < ActiveRecord::Base
  belongs_to :bucket
  validates_presence_of :bucket
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  has_many :comments, :order => "created_at DESC"
  has_many :votes
  validates :title, :length => { :minimum => 1 }
  validates :body, :length => { :minimum => 1 }
  
  trim_fields :title, :body

end

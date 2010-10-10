class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  belongs_to :post
  validates_presence_of :post
  has_many :votes
  belongs_to :parent, :class_name => "Comment"
  has_many :replies, :class_name => "Comment", :foreign_key => "parent_id", :order => "created_at DESC", :dependent => :destroy
  
  validates :body, :length => { :minimum => 1 }
  
  scope :original, :conditions => { :parent_id => nil }
  
  attr_protected :author_id, :post_id, :score_counter
  
  trim_fields :body
  
  def score
    self.score_counter
  end
end

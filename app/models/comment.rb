class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  belongs_to :post
  validates_presence_of :post
  has_many :votes
  validates :body, :length => { :minimum => 1 }
  
  attr_protected :author_id, :post_id, :score_counter
  
  trim_fields :body
  
  def score
    self.score_counter
  end
end

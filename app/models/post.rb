class Post < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account

  belongs_to :bucket
  validates_presence_of :bucket
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  has_many :comments, :order => "created_at DESC"
  has_many :votes
  validates :title, :length => { :minimum => 1 }
  validates :body, :length => { :minimum => 1 }, :unless => Proc.new { |p| p.is_link? }
  
  attr_protected :score_counter, :author_id
  
  trim_fields :title, :body

  def is_link?
    !self.url.blank?
  end
  
  def score
    self.score_counter
  end
  
  def safe_url
    return nil unless is_link?
    unless url.index("http://") || url.index("https://")
      return "http://#{url}"
    else
      url
    end
  end
  
  def short_url
    return nil unless is_link?
    match = url.match(/(https?\:\/\/[a-z0-9\-\_\.]+)/i)
    return match[1]
  end
  
end

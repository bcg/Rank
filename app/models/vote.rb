class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :comment
  belongs_to :voter, :class_name => "User"
  validates_presence_of :voter
end

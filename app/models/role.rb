class Role < ActiveRecord::Base
  Admin = "admin"
  Moderator = "moderator"
  Author = "author"
  Roles = [Admin, Moderator, Author]
  
  validates_inclusion_of :name, :in => Roles
end

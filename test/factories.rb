Factory.define(:account) do |account|
  account.cname "example.com"
end

Factory.define(:site_configuration) do |config|
  config.association :account
  config.display_name "Test Site"
end

Factory.define(:user) do |u|
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  u.first first
  u.last last
  u.sequence(:email) { |s| "#{first}#{last}#{s}@gmail.com" }
  u.sequence(:username) { |s| "#{first}#{last}#{s}" }
  u.password "default"
  u.password_confirmation "default"
  u.association :account, :factory => :account
end

Factory.define(:admin_user, :parent => :user) do |u|
  u.after_build { |user|
    user.roles << Factory.build(:role)
  }
end

Factory.define(:post) do |p|
  p.title "Test posting"
  p.body "This is a test posting."
  p.association :author, :factory => :user
  p.association :bucket
end

Factory.define(:bucket) do |b|
  b.name "Test bucket"
  b.association :owner, :factory => :user
end

Factory.define(:role) do |role|
  role.name Role::Admin
end
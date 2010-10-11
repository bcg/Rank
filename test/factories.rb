Factory.define(:site_configuration) do |config|
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
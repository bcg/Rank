Given /^a user with username "([^"]*)" and password "([^"]*)"$/ do |username, password|
  user = Factory(:user, :username => username, :password => password, :password_confirmation => password)
  @current_user = user
end

Given /^I have not used the bookmarklet yet$/ do
  @current_user.bookmarklet_installed = false
  @current_user.save!
end

Given /^I am logged in as "([^"]*)" with password "([^"]*)"$/ do |username, password|
  visit '/login'
  fill_in("Username", :with => username)
  fill_in("Password", :with => password)
  click_button "Log in"
end

When /^I post something with the bookmarklet$/ do
  @current_user.bookmarklet_installed = true
  @current_user.save!
end
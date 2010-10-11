Given /^there is a user with username "([^"]*)" and password "([^"]*)"$/ do |username, password|
  user = Factory(:user, :username => username, :password => password, :password_confirmation => password)
end

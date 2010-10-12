require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I visit subdomain (.+)$/ do |sub|
  host! "#{sub}.#{TEST_DOMAIN}"  #TEST_DOMAIN is defined in test.rb.
end

Then /^I should be visiting the base subdomain/ do
  subdomains = URI.parse(request.url).host.split('.')
  subdomains = subdomains[0...(subdomains.size - (SubdomainFu.tld_size+1))]
  subdomains.first.should == SubdomainFu.preferred_mirror 
end

Then /^I should be visiting subdomain (.*)$/ do |subdomain|
  subdomains = URI.parse(current_url).host.split('.')
  subdomains = subdomains[0...(subdomains.size - (SubdomainFu.tld_size+1))]
  subdomains.first.should == subdomain 
end

Then /^I should not see element "([^"]*)"$/ do |selector|
  page.should have_no_css(selector)
end

Then /^I should see element "([^"]*)"$/ do |selector|
  page.should have_css(selector)
end

Then /^I should see a form with an error$/ do
  page.should have_selector("#errorExplanation")
end

Then /^I should be downloading "([^"]*)"$/ do |arg1|
  assert @response.header["Content-Disposition"].include? "attachment"
end

Given /^today is "([^"]*)"$/ do |date|
  Timecop.freeze(Time.parse(date))
end

When /^the date is now "([^"]*)"$/ do |date|
  Timecop.travel(Time.parse(date))
end

# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))
#
# module WithinHelpers
#   def with_scope(locator)
#     locator ? within(*selector_for(locator)) { yield } : yield
#   end
# end
# World(WithinHelpers)


Given /^I have an account for (.*)$/ do |account|
  User.create!(email: account, password: 'hunter2')
end

<<<<<<< HEAD
Then /^I should be a (.*)$/ do |level|
  pending 
end

Then /^I should not be (.*)$/ do |level|
  pending
end

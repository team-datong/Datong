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

Given /^I am a(?:n?) (.*)$/ do |level|
  if level.equal?('core member')
    fname = 'core'
    lname = 'member'
    email = 'core@member.com'
    password = 'hunter2'
    User.new(:fname => fname, :lname => lname, :email => email, :password => password, :password_confirmation => password, :is_core_member => true, :confirmed_at => Time.now).save!
  elsif level.equal?('event admin')
    fname = 'event'
    lname = 'admin'
    email = 'event@admin.com'
    password = 'hunter2'
    User.new(:fname => fname, :lname => lname, :email => email, :password => password, :password_confirmation => password, :is_event_admin => true, :confirmed_at => Time.now).save!

  elsif level.equal?('account admin')
    fname = 'account'
    lname = 'admin'
    email = 'account@admin.com'
    password = 'hunter2'
    User.new(:fname => fname, :lname => lname, :email => email, :password => password, :password_confirmation => password, :is_account_admin => true, :confirmed_at => Time.now).save!
  end
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given /^I am not a(?:n?) (.*)$/ do |level|
  pending
end

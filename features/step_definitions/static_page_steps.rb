require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Then /^I should see (.*)$/ do |text|
  case text
    when 'the nav bar'
      expect(page).to have_selector('nav')
    else
      expect(page).to have_content(text)

  end
end

Given /^I have an account for (.*@.*) with password (.*)$/ do |email, password|
  pending
  #add entry for user: email, password
end

Given /^I do not have an account$/ do
  pass
end

Given /^I am not logged in$/ do
  pending
end

Given /^I am logged in$/ do
  pending
  #log them into the default account: datongtest@datong.berkeley.edu, hunter2
end




When /^(?:|I )follow (.*)$/ do |link|
  click_link(link)
end

And /^I should not see (.*)$/ do |text|
    expect(page).not_to have_content(text)
end

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

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

And /^(?:|I )upload the "(.*)"$/ do |filename|
    pending
end

When /^(?:|I )have "(.*)" access$/ do |auth|
    pending
end

Then /^(?:|I )should see the "(.*)" button$/ do |button|
    pending
end

When /^(?:|I )follow (.*)$/ do |link|
  click_link(link)
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

And /^I should not see (.*)$/ do |text|
    expect(page).not_to have_content(text)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Given /^I am not logged in$/ do
  pending
end


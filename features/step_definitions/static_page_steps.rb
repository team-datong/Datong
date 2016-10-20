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

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  # if page.respond_to? :should
  #   page.should have_content(text)
  # else
  #   assert page.has_content?(text)
  # end
  pending
end


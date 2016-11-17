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

And /^(?:|I )upload the "(.*)"$/ do |filename|
    test_file = fixture_file_upload('features/testfiles/test_file.txt', 'text')
    post "/resources", :title => 'test_file_name', :attachment => test_file
end

When /^(?:|I )have "(.*)" access$/ do |auth|
    pending
end


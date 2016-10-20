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


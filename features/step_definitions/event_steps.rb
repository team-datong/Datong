Given /^I create the event (.*)$/ do |title|
  Event.new(:title => title, :start_time => Time.now, :end_time => Time.now, :created_at => Time.now, :updated_at => Time.now).save!
end
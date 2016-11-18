# spec/factories/past_events.rb
require 'faker'

FactoryGirl.define do
  factory :past_event do |f|
    f.title "Title"
    f.description "Description"
    f.date_and_time DateTime.now
  end
end
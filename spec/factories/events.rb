# spec/factories/events.rb
require 'faker'

FactoryGirl.define do
  factory :event do |f|
    f.title "Title"
  end
end
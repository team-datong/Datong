# spec/factories/users.rb
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    email 'notadmin@example.com'
    password 'badpassword'
  end
end

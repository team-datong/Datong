# spec/models/past_event_spec.rb

require 'spec_helper'
require 'rails_helper'

describe PastEvent do
  it "has a valid factory" do
    FactoryGirl.create(:past_event).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:past_event, title: nil).should_not be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:past_event, description: nil).should_not be_valid
  end
  it "is invalid without a date and time" do
    FactoryGirl.build(:past_event, date_and_time: nil).should_not be_valid
  end
end
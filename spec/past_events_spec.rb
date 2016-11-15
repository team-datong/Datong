require 'spec_helper'
require 'rails_helper'

describe PastEventsController, type: 'controller' do
  before :each do
    @past_events = []
  end

  describe '.index' do
    it "assigns @past_events" do
      get :index
      expect(assigns(:past_events)).to eq(@past_events)
    end
    it 'properly renders' do
      get :index
      expect(response).to render_template("index")
      expect(page).to have_content("Events")
    end
  end

  describe '.new' do
    before :each do
      get :new
    end
    it 'assigns a new PastEvent to @past_event' do
      expect(assigns(:past_event)).should_not be_nil
    end
    it 'properly renders' do
      response.should render_template 'new'
      expect(page).to have_content("Add Past Event")
      expect(page).to have_selector("label#title")
      expect(page).to have_selector("label#description")
      expect(page).to have_selector("label#datetime")
    end
    it 'accepts input (happy path)' do
      fill_in "title", :with => "Ice Cream social"
      fill_in "description", :with => "Come out to meet our core members and eat delicious ice cream!"
      select "2013/11/10", :from => "Start date and time"
      click_button(".save")
      past_event = stub('new past event').as_null_object
      expect(PastEvent).to receive(:create!).and_return(past_event)
      post :create, {:past_event => past_event}
      response.should redirect_to(past_events_path)
    end
  end

  describe '.create' do

  end

  describe '.edit' do
    before :each do
      get :edit
    end
    it 'properly renders' do
      expect(page).to have_content("New past event")
      expect(page).to have_selector("label#title[value='BBQ']")
      expect(page).to have_selector("label#description[value='Come out to meet our core members and eat some BBQ!']")
      expect(page).to have_selector("label#datetime")
    end
    it 'saves without changes' do
      click_button(".save")
      expect(PastEvent).to receive(:update_attributes!).and_return(past_event)
      post :update_attibutes, {:past_event => past_event}
      response.should redirect_to(past_events_path)
    end
    it 'saves with valid changes' do
      fill_in "description", :with => "Come out for some BBQ!"
      select "2012/11/10", :from => "Start date and time"
      click_button(".save")
    end

    it 'discards changes when cancelled' do
      fill_in "description", :with => "Come out for some BBQ!"
      select "2012/11/10", :from => "Start date and time"
      click_button(".cancel")
    end

  end

  describe '.update' do

  end

  describe '.destroy' do

  end
end

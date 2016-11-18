require 'spec_helper'
require 'rails_helper'

describe 'PastEventsController', :type => :controller do
  render_views

  before :each do
    @controller = PastEventsController.new
  end

  describe '#index' do
    it "assigns @past_events" do
      past_event = PastEvent.create(title: 'title of event', description: 'description of event', date_and_time: DateTime.now)
      get :index

      expect(assigns(:past_events)).to eq([past_event])
    end
    it 'properly renders' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    before :each do
      get :new
    end
    it 'assigns a new PastEvent to @past_event' do
      expect(assigns(:past_event)).to be_a_new(PastEvent)
    end
    it 'properly renders' do
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    it 'redirects to past events page on save' do
      post :create, past_event: FactoryGirl.attributes_for(:past_event)
      expect(response).to redirect_to(past_events_path)
    end
    it 'renders new page on failed save' do
      post :create, past_event: FactoryGirl.attributes_for(:past_event, title: nil, description: 'some description', date_and_time: DateTime.now)
      expect(response).to redirect_to(new_past_event_path)
    end
  end

  describe '#edit' do
    before :each do
      @past_event = PastEvent.create(title: 'title of event', description: 'description of event', date_and_time: DateTime.now)
      get :edit, id: @past_event.id
    end
    it 'properly renders' do
      expect(response).to render_template(:edit)
    end

  end

  describe '#update' do

    before(:each) do
      @past_event = FactoryGirl.create(:past_event, title: 'current title', description: 'current description', date_and_time: DateTime.now)

    end

    context 'valid attributes' do
      before(:each) do
        put :update, id: @past_event, past_event: FactoryGirl.attributes_for(:past_event, title: 'new title', description: 'new description', date_and_time: DateTime.now)
      end
      it 'locates the requested past event' do
        assigns(:past_event).should eq(@past_event)
      end
      it 'should update the past event' do
        @past_event.reload
        @past_event.title.should eq('new title')
      end
      it 'should redirect to list of past events' do
        expect(response).to redirect_to(past_events_path)
      end
    end

    context 'invalid attributes' do

      it 'locates the requested past event' do
        put :update, id: @past_event, past_event: FactoryGirl.attributes_for(:past_event, title: nil, description: 'new description', date_and_time: DateTime.now)
        assigns(:past_event).should eq(@past_event)
      end
      it 'should not update the past event title' do
        put :update, id: @past_event, past_event: FactoryGirl.attributes_for(:past_event, title: nil, description: 'new description', date_and_time: DateTime.now)
        @past_event.reload
        @past_event.title.should_not be_nil
        @past_event.title.should eq('current title')
        @past_event.description.should_not eq('new description')
        @past_event.description.should eq('current description')
      end
      it 'should redirect to list of past events' do
        put :update, id: @past_event, past_event: FactoryGirl.attributes_for(:past_event, title: nil, description: 'new description', date_and_time: DateTime.now)
        expect(response).to redirect_to("/past_events/#{@past_event.id}/edit")
      end

    end

  end

  describe '#destroy' do
    before(:each) do
      @past_event = FactoryGirl.create(:past_event, title: 'current title', description: 'current description', date_and_time: DateTime.now)
    end
    it 'should redirect to list of past events' do
      delete :destroy, id: @past_event
      expect(response).to redirect_to(past_events_path)
    end
    it 'should no longer exist' do
      expect {
        delete :destroy, id: @past_event
      }.to change(PastEvent, :count).by(-1)
    end
  end
end

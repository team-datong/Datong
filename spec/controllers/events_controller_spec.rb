require 'rails_helper'

describe 'EventsController', type: :controller do
  render_views

  before :each do
    @controller = EventsController.new
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    it 'assigns @events' do
      event = Event.create(title: 'Valid title')
      get :index
      expect(assigns(:events)).to eq([event])
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
    it 'assigns a new Event to @event' do
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe '#create' do
    it 'redirects to event' do
      post :create, event: FactoryGirl.attributes_for(:event)
      expect(response).to redirect_to(Event.last)
    end
    it 'renders new page on failed save' do
      post :create, event: FactoryGirl.attributes_for(:event, title: nil)
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    before :each do
      @event = Event.create(title: 'event title')
      get :edit, id: @event.id
    end
    it 'properly renders' do
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    before :each do
      @event = FactoryGirl.create(:event, title: 'current title')
    end
    context 'valid attributes' do
      before :each do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: 'new title')
      end
      it 'locates the requested event' do
        assigns(:event).should eq(@event)
      end
      it 'should update the event' do
        @event.reload
        @event.title.should eq('new title')
      end
      it 'should redirect to show event' do
        expect(response).to redirect_to(Event.last)
      end
    end
    context 'invalid attributes' do
      before :each do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: nil)
      end
      it 'locates the requested event' do
        assigns(:event).should eq(@event)
      end
      it 'should not update the event title' do
        @event.reload
        @event.title.should_not be_nil
        @event.title.should eq('current title')
      end
      it 'should render edit' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    before :each do
      @event = FactoryGirl.create(:event, title: 'current title')
    end
    it 'should no longer exist' do
      expect {
        delete :destroy, id: @event
      }.to change(Event, :count).by(-1)
    end
    it 'should redirect to events index' do
      delete :destroy, id: @event
      expect(response).to redirect_to(events_url)
    end
  end

end

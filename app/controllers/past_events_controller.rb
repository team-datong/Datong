class PastEventsController < ApplicationController
  def index
    @past_events = PastEvent.all
  end

  def new
    @past_event = PastEvent.new
  end

  def create
    @past_event = PastEvent.create!(past_event_params)
    flash[:notice] = "Event created"

    redirect_to past_events_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def past_event_params
    params.require(:past_event).permit(:title, :description, :date_and_time)
  end
end

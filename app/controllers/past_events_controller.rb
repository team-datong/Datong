class PastEventsController < ApplicationController
  def index
    @past_events = PastEvent.all
  end

  def new
    @past_event = PastEvent.new
  end

  def create
    past_event = PastEvent.new(past_event_params)
    if past_event.save
      flash[:success] = "Event created"
      redirect_to past_events_path
    else
      flash[:error] = "Event creation failed"
      redirect_to new_past_event_path
    end
  end

  def edit
    @past_event = PastEvent.find_by_id(params[:id])
  end

  def update
    @past_event = PastEvent.find_by_id(params[:id])
    if @past_event.update_attributes(past_event_params)
      flash[:success] = "Event updated"
      redirect_to past_events_path
    else
      flash[:error] = "Missing or invalid required field(s)"
      redirect_to edit_past_event_path(params[:id])
    end
  end

  def destroy
    @past_event = PastEvent.find_by_id(params[:id])
    @past_event.delete
    flash[:notice] = "Event deleted"
    redirect_to past_events_path
  end

  private

  def past_event_params
    params.require(:past_event).permit(:title, :description, :date_and_time)
  end
end

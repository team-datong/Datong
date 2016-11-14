class PastEventsController < ApplicationController
  def index
    @past_events = PastEvent.all
  end

  def new
    @past_event = PastEvent.new
  end

  def create
    @past_event = PastEvent.create!(params[:past_event])
    flash[:notice] = "#{@past_event.title} was successfully created."
    redirect_to past_events_path
  end

  def edit
    @past_event = PastEvent.find params[:id]
  end

  def update
    @past_event = PastEvent.find params[:id]
    @past_event.update_attributes!(params[:past_event])
    flash[:notice] = "#{@past_event.title} was successfully updated."
    redirect_to past_events_path
  end

  def destroy
    @past_event = PastEvent.find params[:id]
    @past_event.destroy
    flash[:notice] = "#{@past_event.title} was deleted."
    redirect_to past_events_path
  end
end
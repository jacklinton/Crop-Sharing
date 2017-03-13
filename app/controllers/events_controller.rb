class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:update, :show, :edit]
    
  def index
    @events = Event.all
  end

  def new
    @listing = Listing.new()
  end

  def show
  end

  def edit
  end
  
  def update
    if @listing.update_attributes(type: event_params[:type],
              lat: event_params[:lat],
              lng: event_params[:lng],
              name: event_params[:name],
              description: event_params[:description],
              date: event_params[:date])
  end 

  def form
  end
end

private

def set_event
    @event = Event.find(params[:id])
end

def event_params
    params.require(:event).permit(:type, :lat, :lng, :name, :description, :date)
end
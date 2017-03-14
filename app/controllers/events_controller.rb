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
              private_event: event_params[:private_event],
              description: event_params[:description],
              date: event_params[:date])
          flash[:notice] = "You have successfully edited your event!"
          redirect_to listing_path(@listing) 
    else
          flash[:alert] = "There was a problem updating your event information, please try again."
          render :edit
    end
  end 

  def create
    @user = current_user
    @event = Event.new
    @event.update_attributes(user_id: @user.id,
            type: event_params[:type],
            lat: event_params[:lat],
            lng: event_params[:lng],
            name: event_params[:name],
            description: event_params[:description],
            date: event_params[:date],
            photo: event_params[:photo])
    if @event.save
        flash[:notice] = "You have successfully created a new event!"
        redirect_to event_path(@event)
    else
        flash[:alert] = "There was a problem creating your listing, please try again later."
    end
  end
  
  def delete
      @event.destroy
  end

end

private

def set_event
    @event = Event.find(params[:id])
end

def event_params
    params.require(:event).permit(:type, :lat, :lng, :name, :description, :date)
end
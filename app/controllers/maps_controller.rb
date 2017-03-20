class MapsController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @usershash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.lat
      marker.lng user.lng
      marker.title user.username
    end
    @listings = Listing.all
    @listingshash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.lat
      marker.lng listing.lng
      marker.title listing.title
    end
    @events = Event.all
    @eventshash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.lat
      marker.lng event.lng
      marker.title event.name
    end
  end
end

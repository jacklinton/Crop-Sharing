class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :set_listing, only: [:update, :show, :edit]
    
    def index
        @listings = Listing.all
        @user = current_user
        @listingshash = Gmaps4rails.build_markers(@listings) do |listing, marker|
          marker.lat listing.lat
          marker.lng listing.lng
          marker.title listing.title
        end
    end
    
    def new
        @listing = Listing.new()
    end
    
    def edit
        
    end
    
    def update
        if @listing.update_attributes(title: listing_params[:title],
                address: listing_params[:address],
                lat: listing_params[:lat],
                lng: listing_params[:lng],
                category: listing_params[:category],
                acc_cash: listing_params[:acc_cash],
                acc_trade: listing_params[:acc_trade],
                description: listing_params[:description],
                wants: listing_params[:wants],
                quantity: listing_params[:quantity],
                harvest_date: listing_params[:harvest_date],
                exp_date: listing_params[:exp_date],
                picture: listing_params[:picture])
            flash[:notice] = "Successfully updated your listing!"
            redirect_to listing_path(@listing)
        else
          flash[:alert] = "There was a problem updating your listing information, please try again."
          render :edit
        end
    end
    
    def show
        @user = current_user
    end
    
    def create
        @user = current_user
        @listing = Listing.new
        @listing.update_attributes(user_id: @user.id,
                title: listing_params[:title],
                address: listing_params[:address],
                lat: listing_params[:lat],
                lng: listing_params[:lng],
                category: listing_params[:category],
                acc_cash: listing_params[:acc_cash],
                acc_trade: listing_params[:acc_trade],
                description: listing_params[:description],
                wants: listing_params[:wants],
                quantity: listing_params[:quantity],
                harvest_date: listing_params[:harvest_date],
                exp_date: listing_params[:exp_date],
                picture: listing_params[:picture])
        if @listing.save
            flash[:notice] = "You have successfully created a new listing!"
            redirect_to listing_path(@listing)
        else
            flash[:alert] = "There was a problem creating your listing. Please try again."
            render :new
        end
    end
    
    def delete
        @listing.destroy
    end
end

private

def set_listing
    @listing = Listing.find(params[:id])
end

def listing_params
    params.require(:listing).permit(:title, :address, :lat, :lng, :category, :acc_cash, :acc_trade, :description, :wants, :quantity, :harvest_date, :exp_date, :picture)
end
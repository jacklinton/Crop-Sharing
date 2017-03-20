class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:update, :show, :edit]
	
	def index
		
	end
	
	def show
		@listings = Listing.where(user_id: params[:id])
		@events = Event.where(user_id: params[:id])
	end
	
	def update
		@user = current_user
		@user.update_attributes(user_params)
		if @user.save
			flash[:notice] = "You have updated your user settings!"
			redirect_to(:back)
		else
			flash[:alert] = "There was a problem changing your settings."
			redirect_to(:back)
		end
	end
end

private

def set_user
	@user = User.find(params[:id])
end

def user_params
	params.require(:user).permit(:id, :address, :lat, :lng, :avatar)	
end
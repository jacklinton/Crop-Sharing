class RegistrationsController < Devise::RegistrationsController
	def create
		user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		sign_in(:user, user)
		redirect_to root_path
	end
end
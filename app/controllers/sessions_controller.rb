class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user
			flash[:success] = "You have sucessfully signed in."
			sign_in user
			redirect_to user
		else
			flash.now[:error] = "Invalid email, please try again."
			render :new
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end

class UsersController < ApplicationController
  
  # before_action :signed_in_user, only: [:edit, :update]
  # before_action :correct_user, only: [:edit, :update, :show]

  # def new
  # 	@user = User.new
  # end

  # def create
  # 	@user = User.new(user_params)
  # 	if @user.save
  # 		flash[:success] = "Profile created"
  #     sign_in @user
  # 		redirect_to @user
  # 	else
  # 		# flash.now[:error] = "Oops.. something wrong."
  # 		render :new
  # 	end
  # end

  def show
  	@user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "Profile updated"
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

  # private

  # 	def user_params
  # 		params.require(:user).permit(:name, :email, :avatar)
  # 	end
    
    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to signin_url unless current_user?(@user)
    # end
end

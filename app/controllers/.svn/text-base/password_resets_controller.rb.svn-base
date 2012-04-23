class PasswordResetsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user
		   user.send_password_reset 
		   redirect_to login_path, :notice => "An email has been sent with reset instructions"
		else
		   redirect_to login_path, :alert => "You are not registered. Click sign up to register"
		end
	end

	def edit
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_expired?
			redirect_to login_path, :alert => "You requested this reset too long ago, please try again"
		else
			render
		end
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_expired?
			redirect_to new_password_reset_path, :alert => "Your password reset request has expired."
		elsif @user.update_attributes(params[:user])
			session[:user_id] = @user.id
			redirect_to @user, :notice => "Password has been reset!, you are now logged in"
		else
			render :edit
		end
	end
end

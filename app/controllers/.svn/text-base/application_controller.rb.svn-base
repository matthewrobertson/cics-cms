class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
  	if @current_user.nil? && session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
    @current_user
  end

  helper_method :current_user
  
  def is_logged_in
    if current_user.nil? 
      redirect_to login_url, :alert => "Please login First!" 
      return false
    end
  end
  #Authentication Code End
  
  #Exception Code Begin
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil? 
      redirect_to login_url, :alert => "You are not authorized! Please login as appropriate user" 
    else
      redirect_to user_path(current_user), :alert => "You are not authorized!"
    end
  end
  #Exception Code End
end

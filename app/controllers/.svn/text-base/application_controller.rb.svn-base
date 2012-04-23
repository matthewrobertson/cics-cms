class ApplicationController < ActionController::Base
  

  helper_method :current_user
  helper_method :home_path
  
  def current_user
  	if @current_user.nil? && session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
    @current_user
  end
  
  def is_logged_in
    if current_user.nil? 
      session[:cached_path] = request.url
      redirect_to login_url, :alert => "Please login First!" 
      return false
    end
  end

  def home_path
    if current_user.try :admin?
      return admin_dashboard_path
    elsif current_user
      return user_path(current_user)
    else
      return login_path
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil? 
      redirect_to login_url, :alert => "You are not authorized! Please login as appropriate user" 
    else
      redirect_to user_path(current_user), :alert => "You are not authorized!"
    end
  end
  
end

class SessionsController < ApplicationController

  respond_to :html, :xml, :json

  def new
    if current_user
      redirect_to home_path, :alert => "You are already logged in"
    else
      render
    end
  end
  	
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to home_path, :notice => "Logged in!" }
        format.json { render :json => user.to_json }
      end
    else
      flash.now.alert = "Invalid email or password"
      respond_to do |format|
        format.html { render "new" }
        format.json { render :json => {error: "invalid user name or password"}.to_json }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end

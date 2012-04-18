class MobileController < ApplicationController

  def index
  	@user = current_user
    render :layout => false
  end

end
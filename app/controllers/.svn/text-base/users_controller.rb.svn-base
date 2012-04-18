class UsersController < ApplicationController
  
  before_filter :is_logged_in, :except => [:new, :create] 

  respond_to :html, :xml, :json



  def index

    if(params[:search])
      @users = User.find(:all, :conditions => ['full_name LIKE ?', "%#{params[:search]}%"])
    else
      @users = nil
    end

    #@users = User.all
    #respond_with @users
  end

  def show
    @user = User.find(params[:id])
    @managed_projects = @user.owned_projects.all
    @contrib_projects = @user.projects.all
    @admin_latest = Announcement.find_last_by_project_id(params[:id => 0])
    
  end

  def new
    if(current_user)
      redirect_to current_user, :alert => "You are already logged in"
    else
      @user = User.new
    end
  end

	
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end
  
  

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
end

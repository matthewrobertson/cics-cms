class AnnouncementsController < ApplicationController
  before_filter :is_logged_in
  respond_to :html, :xml, :json
  before_filter :find_project, :only => [:index, :new, :create]
  
  def index
    @announcements = @project.announcements.all
  end

  def show
    @announcement = Announcement.find(params[:id])   
  end

  def new
    @announcement = @project.announcements.build
  end


  def create
    @announcement = @project.announcements.build(params[:announcement])
    @announcement.user = current_user
    if @announcement.save
      redirect_to @project, :notice => "Successfully created announcement."
    else
      render :action => 'new'
    end
  end



  def edit
    @announcement = Announcement.find(params[:id])
    respond_with @announcement
  end

  def update
    @announcement = Announcement.find(params[:id])
    @announcement.update_attributes(params[:announcement])
    flash[:notice]  = "Successfully updated announcement." if @announcement.valid?
    respond_with @announcement
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    respond_with @announcement
  end

  def find_project
    @project = Project.find(params[:project_id])
  end


end

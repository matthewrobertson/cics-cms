class ProjectsController < ApplicationController

  before_filter :is_logged_in
  
  respond_to :html, :xml, :json

  def index
    if(params[:search])
      @projects = Project.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
      @projects = nil
    end
  end

  def show
    @project = Project.find(params[:id])
    @managed_users = @project.users.all
    @managed_resources = @project.resources.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    if @project.save
      redirect_to @project, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Successfully destroyed project."
  end
end

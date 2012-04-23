class ResourcesController < ApplicationController
  
  before_filter :is_logged_in
  respond_to :html, :xml, :json
  before_filter :find_project, :only => [:index, :new, :create]

  def index
    @resources = @project.resources.all
  end

  def show
    @resource = Resource.find(params[:id])

  end

  def new
    @resource = @project.resources.build
  end

  def create
    #unless fname.kind_of? String
    if params[:resource]
      @resource = @project.resources.build(params[:resource])
    else
      @resource = @project.resources.build(params)
    end
    @resource.version = 1
    @resource.user = current_user
    if @resource.save
      redirect_to @project, :notice => "Successfully created resource."
    else
      render :action => 'new'
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(params[:resource])
      @resource.version += 1
      @resource.save!
      redirect_to @resource.project, :notice  => "Successfully updated resource."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.delete
    redirect_to @resource.project, :notice => "Successfully destroyed resource."
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

end

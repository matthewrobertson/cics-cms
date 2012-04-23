class ContributionsController < ApplicationController

  before_filter :is_logged_in
  respond_to :html, :xml, :json

  def create
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    if Contribution.create(:project => @project, :user => @user)
      redirect_to current_user, :notice => "Your request has been submitted successfully"
    else
      redirect_to projects_path, :alert => "Sorry something went wrong"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @user = User.find(params[:id])
    @project.users.delete @user
    redirect_to @project, :alert => "The contributor was removed from the project"
  end

end

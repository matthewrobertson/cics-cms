class InvitationsController < ApplicationController

	respond_to :html, :xml, :json

	before_filter :is_logged_in
	before_filter :load_project


	def index
		if @project.users.include? current_user || @project.owner == current_user
			redirect_to @project, :alert => "You already contribute to this project"
		else
			@project.users << current_user
			redirect_to @project, :notice => "You are now a contributor to this project"
		end
	end

    def new
    	@invitation = Invitation.new
    end

    def create
    	@invitation = Invitation.new params[:invitation]
    	if @invitation.valid?
    		@invitation.send_invitation @project, current_user
    		redirect_to @project, :notice => "Your invitation has been sent"
    	else
    		render :new
    	end
    end

    private

    def load_project
    	@project = Project.find(params[:project_id])
    end
	
end

class MyProjectsController < ApplicationController

	before_filter :is_logged_in
  	respond_to :html, :xml, :json

	def index
		@projects = current_user.projects.all
		@projects.concat current_user.owned_projects.all
		respond_with @projects
	end
end


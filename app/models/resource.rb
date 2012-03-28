class Resource < ActiveRecord::Base
	belongs_to :project, :foreign_key => :project_id, :class_name => "Project"
	belongs_to :user, :foreign_key => :user_id, :class_name => "User"
	has_and_belongs_to_many :users

	# validates associated is crashing app, commenting out for now - Matthew
	# validates_associated :users, :owner, :project

	attr_accessible :name, :version, :description, :mime, :user_id, :project_id, :file

#	validates_presence_of :name, :version, :description, :mime, :project_id, :user_id, :created_at, :updated_at
#	validates_format_of :name, :with => /^[a-zA-Z0-9_-]{3,}[\.]{0,}[a-zA-Z0-9_-]{0,}$/i
#	validates_length_of :description, :minimum => 4, :maximum => 256


	mount_uploader :file, ResourceUploader

	def file_name
		File.basename(self.file.url) if self.file
	end

end

ActiveAdmin.register Project do
	sidebar "Resources for current project", :only =>:show do
		table_for Resource.where(:project_id => self.project) do |t|
			t.column("Resources") { |resource| link_to resource.name, admin_resource_path(resource) }
		end	
	end
	
	sidebar "Contributors for current project", :only =>:show do
		table_for self.project.users.each do |t|
			t.column("Contributors") { |user| link_to user.full_name, admin_user_path(user) }
		end	
	end
	
	
  
  index do
    column "Project Name", :name
    column "Start Date", :started_at
    column "End Date", :ending_at
    column "Owner", :owner
	column "Description", :description
	column "Created date", :created_at
	column "Last modified", :updated_at
    default_actions
  end
 
  
end

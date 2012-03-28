ActiveAdmin.register Project do
	member_action :projectmanagement do
      @project = Project.find(params[:id])
	end
  
  index do
    column "Project Name", :name
    column "Start Date", :started_at
    column "End Date", :ending_at
    column "Owner", :owner
    column "Contributors" do |proj|
      names = ""
       proj.users.each do |user|
        names += user.name + " "
       end
       names
     end
	   column "Description", :description
	   column "Created date", :created_at
	 column "Last modified", :updated_at
    default_actions
  end
end

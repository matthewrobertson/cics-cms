ActiveAdmin.register Announcement do
	index do
	column  "User name", :user
    column  "Topic", :topic
	column  "Project", :project
	column  "Type", :kind
    column  "Content", :content
    column  "Create date", :created_at
    column  "Last modified", :updated_at
	default_actions
  end
  
  form do |f|
      f.inputs "Details" do
		f.input :user_id, :as => :hidden, :value => current_user.id
		f.input :kind, :as => :hidden, :value => "admin announcement"
        f.input :topic 
        f.input :content
	end
      f.buttons
  end
  
end

ActiveAdmin.register User do
	scope :administrator
	
	
 
  index do
	column  "Full name", :full_name
    column  "Nick name", :pref_name
    column  "Email", :email
    column  "Is admin?", :admin? 	
    column  "Create date", :created_at
    column  "Last modified", :updated_at
	default_actions
  end
  
 # edit do
  
	
	#end

	form do |f|
      f.inputs "Details" do
        f.input :full_name, :label => "Full Name"
        f.input :pref_name, :label => "Preferred Name"
        f.input :email
      end
      f.buttons
    end
  
  
  action_item :only => :edit do
		if(user.admin == true)
		link_to "Remove admin", remove_admin_path(user)
		else
		link_to "Set as admin", create_admin_path(user)
	end
		  
  end



  #if they are an admin
  # link_to "make admin", create_admin_path(user)
  #if they are not an admin
  # link_to "remove admin", remove_admin_path(user)
  
end

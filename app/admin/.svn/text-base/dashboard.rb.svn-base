ActiveAdmin::Dashboards.build do

	section "New users" do
		table_for User.order("created_at desc").limit(3) do
			column  "Full name", :full_name do |user|
				link_to user.full_name, admin_user_path(user)
			end
			column  "Nick name", :pref_name
			column  "Email", :email
			column  "Is admin?", :admin
		end
		strong { link_to "View all users", admin_users_path }
	end
	
	section "New Project" do
			table_for Project.order("created_at desc").limit(3) do
				column  "Project name", :name do |project|
					link_to project.name, admin_project_path(project)
				end
				column "Start Date", :started_at
				column "End Date", :ending_at
				column "Owner ID", :owner_id
				column "Created date", :created_at
			end
		strong { link_to "View all projects", admin_projects_path }
	end
			
	section "New Announcement" do
		table_for Announcement.order("created_at desc").limit(3) do
			column  "Topic", :topic do |announcement|
				link_to announcement.topic, admin_announcement_path(announcement)
			end
			
			column "Content", :content
			column "Author", :user_id
			column "Created date", :created_at
		end
		strong { link_to "View all announcements", admin_announcements_path }
	end
	
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end

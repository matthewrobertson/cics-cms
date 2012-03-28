class RenameUsersProjects < ActiveRecord::Migration
  def up
  	 rename_table :users_projects, :projects_users
  end

  def down
  	rename_table :projects_users, :users_projects
  end
end

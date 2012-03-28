class CreateContributors < ActiveRecord::Migration
  def up
	rename_table :projects_users, :contributions
	change_table :contributions do |t|
      		t.integer :status, :default => 0
	end
  end

  def down
	remove_column :contributions, :status
	rename_table :contributions, :projects_users
  end
end


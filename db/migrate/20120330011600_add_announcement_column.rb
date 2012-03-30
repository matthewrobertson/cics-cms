class AddAnnouncementColumn < ActiveRecord::Migration
  def up
    add_column    :announcements, :project_id, :integer
  end

  def down
    remove_column :announcements, :project_id
  end
end

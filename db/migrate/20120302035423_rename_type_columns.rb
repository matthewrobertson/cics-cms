class RenameTypeColumns < ActiveRecord::Migration
  def up
	rename_column :resources, :type, :mime
	rename_column :announcements, :type, :kind
  end

  def down
	rename_column :resources, :mime, :type
	rename_column :announcements, :kind, :type
  end
end

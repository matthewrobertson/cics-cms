class RenameLocationToFile < ActiveRecord::Migration
  def up
     rename_column :resources, :location, :file 
  end

  def down
  	rename_column :resources, :file, :location 
  end
end

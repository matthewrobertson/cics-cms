class SpellDescriptionCorrectly < ActiveRecord::Migration
  def up
  	rename_column :projects, :destription, :description
  end

  def down
  	rename_column :projects, :description, :destription
  end
end

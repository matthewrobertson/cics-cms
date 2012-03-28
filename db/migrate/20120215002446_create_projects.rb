class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

    	t.datetime	"started_at"
    	t.datetime	"ending_at"
    	t.string	"name"
    	t.text		"destription"
    	t.integer	"owner_id"
    	
		t.timestamps
    end
  end
end

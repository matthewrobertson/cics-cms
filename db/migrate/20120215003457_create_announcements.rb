class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
    	t.integer	"user_id"
    	t.string	"topic"
    	t.text		"content"
    	t.string	"type"
    	
    	t.timestamps
    end
  end
end

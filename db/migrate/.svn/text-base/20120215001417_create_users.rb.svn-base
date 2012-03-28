class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string	"full_name"
    	t.string	"pref_name"
    	t.string	"email"
    	t.boolean	"admin"
    	t.string	"pass_hash"
    	
    	t.timestamps
    end
  end
end

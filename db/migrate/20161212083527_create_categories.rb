class CreateCategories < ActiveRecord::Migration[5.0]
  def change
  	create_table :categories do |t|
  		t.string "title"
    	t.integer "user_id"
    	t.string :filename
	
    	t.timestamps

  	end
  end
end

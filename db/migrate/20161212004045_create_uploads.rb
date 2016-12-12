class CreateUploads < ActiveRecord::Migration[5.0]
  def change
  	create_table :uploads do |t|
  		t.string :title
  		t.integer :category_id
  		t.attachment :upload
  		t.timestamps	
  	end
  end
end

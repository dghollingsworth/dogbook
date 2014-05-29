class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string "description"
    	t.string "url"
    	t.belongs_to "user"
      t.timestamps
    end
  end
end

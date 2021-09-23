class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :photo_gallery_id
      t.integer :status

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :photo_gallery_id
    add_index :photos, :status
  end
end

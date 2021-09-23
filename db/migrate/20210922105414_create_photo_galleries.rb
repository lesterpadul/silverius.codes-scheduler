class CreatePhotoGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_galleries do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
    add_index :photo_galleries, :user_id
    add_index :photo_galleries, :status
  end
end

class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :target_id
      t.integer :amount
      t.string :message

      t.timestamps
    end
    add_index :donations, :user_id
    add_index :donations, :target_id
  end
end

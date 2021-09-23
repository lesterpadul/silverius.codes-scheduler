class CreateMessageGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :message_groups do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string :message_code
      t.integer :status

      t.timestamps
    end
    add_index :message_groups, :user_id
    add_index :message_groups, :receiver_id
    add_index :message_groups, :status
  end
end

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.string :message_code
      t.integer :status

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :status
  end
end

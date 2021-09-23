class AddLastChatIdToMessageGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :message_groups, :last_chat_id, :integer
  end
  add_index :message_groups, :message_code
  add_index :messages, :message_code
end
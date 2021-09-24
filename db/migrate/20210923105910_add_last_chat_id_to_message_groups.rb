class AddLastChatIdToMessageGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :message_groups, :last_chat_id, :integer
  end
end
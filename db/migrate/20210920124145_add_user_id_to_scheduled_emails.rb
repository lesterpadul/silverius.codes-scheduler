class AddUserIdToScheduledEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_emails, :user_id, :integer
    add_index :scheduled_emails, :user_id
  end
end

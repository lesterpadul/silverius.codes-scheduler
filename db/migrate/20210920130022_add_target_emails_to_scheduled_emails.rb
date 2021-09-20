class AddTargetEmailsToScheduledEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_emails, :target_emails, :string, null: false,  default: ""
  end
end
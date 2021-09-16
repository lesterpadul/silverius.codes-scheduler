class CreateScheduledEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_emails do |t|
      t.integer :status, :default => 0
      t.string :subject
      t.string :content_text
      t.string :content_html
      t.integer :repeating_event, :default => 0
      t.date :scheduled_date
      t.time :scheduled_time, :null => false

      t.timestamps
    end
    add_index :scheduled_emails, :status
    add_index :scheduled_emails, :repeating_event
  end
end

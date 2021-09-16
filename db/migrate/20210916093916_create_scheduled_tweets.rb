class CreateScheduledTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_tweets do |t|
      t.integer :status, :default => 0
      t.string :content
      t.integer :repeating_event, :default => 0
      t.date :scheduled_date
      t.time :scheduled_time, :null => false
      t.timestamps
    end
    add_index :scheduled_tweets, :status
    add_index :scheduled_tweets, :repeating_event
  end
end

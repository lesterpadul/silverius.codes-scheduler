class AddUserIdToScheduledTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_tweets, :user_id, :integer
    add_index :scheduled_tweets, :user_id
  end
end

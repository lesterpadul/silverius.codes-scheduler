class AddTweetIdToScheduledTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_tweets, :tweet_id, :string
  end
end

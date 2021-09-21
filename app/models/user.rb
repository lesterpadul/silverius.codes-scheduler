class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_many :scheduled_tweet, foreign_key: "user_id"
    has_one_attached :image_url

    def self.send_tweet (tweet_item)
        # return if does exist
        if !tweet_item
            return false
        end
        
        # return if not nil, so as to avoid re-sending!
        if !tweet_item.tweet_id.nil?
            return false
        end
        
        # return if status is already done
        if tweet_item.status == 1
            return false
        end
        
        # update tweet item
        tweet_item_res = twitter_client(tweet_item.user).update("#{tweet_item.content} - #{tweet_item.scheduled_time.to_s(:time)}")
        
        # update information
        tweet_item.status = 2 # done
        tweet_item.tweet_id = tweet_item_res.id

        # save information
        return tweet_item.save
    end
    
    def self.twitter_client(tweet_item_user)
        Twitter::REST::Client.new do |config|
            config.consumer_key        = "2atk9oPMj8xpaQkNZYpm9ywo5"
            config.consumer_secret     = "ze0wAQBhOugzZUzW9yoeYb9isCfJvZ5XbDoCqRYgPpOc8LolKR"
            config.access_token        = tweet_item_user.twitter_token
            config.access_token_secret = tweet_item_user.twitter_secret
        end
    end

    def get_image_url
        if self.image_url.attached?
            (self.image_url)
        else
            "https://images.unsplash.com/photo-1517849845537-4d257902454a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzMDQzMTg5Mg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=600"
        end
    end
end

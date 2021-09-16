class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    
    def send_tweet (tweet_item, params)
        # update tweet item
        tweet_item_res = twitter_Client.update(tweet_item.content)

        # set parameters
        params['tweet_id'] = tweet_item_res.id.to_s
        params['status'] = 1
        
        # update
        return  {
            "tweet_status" => tweet_item.update(params.permit(:tweet_id, :status)),
            "tweet_id" => tweet_item_res.id.to_s
        }
    end

    def twitter_Client
        Twitter::REST::Client.new do |config|
            config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
            config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
            config.access_token        = self.twitter_token
            config.access_token_secret = self.twitter_secret
        end
    end
end

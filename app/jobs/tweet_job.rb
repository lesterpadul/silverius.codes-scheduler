class TweetJob < ApplicationJob
    queue_as :default

    def perform(tweet)
        User::send_tweet(tweet)
    end
end
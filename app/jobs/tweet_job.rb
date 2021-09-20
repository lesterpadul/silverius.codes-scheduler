class TweetJob < ApplicationJob
    queue_as :default

    def perform(tweet)
        begin
            User::send_tweet(tweet)
        rescue => e
        end
    end
end
class TweetJob < ApplicationJob
    queue_as :default

    def perform(tweet)
        abort "1111111"
    end
end

class ScheduledTweet < ApplicationRecord

    # - when initialized, if has no value -> get the time 24 hours from now instead!
    after_initialize do
        self.scheduled_date ||= 24.hours.from_now
    end
end

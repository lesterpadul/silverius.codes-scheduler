class ScheduledEmail < ApplicationRecord
    #validates :target_emails, presence: true

    # - when initialized, if has no value -> get the time 24 hours from now instead!
    after_initialize do
        self.scheduled_date ||= 5.minutes.from_now
    end
end

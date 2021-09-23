class MessageGroup < ApplicationRecord
    # - when initialized, if has no value -> get the time 24 hours from now instead!
    after_initialize do
        self.message_code ||= "#{self.user_id}_#{self.receiver_id}"
        self.status ||= 1
    end
end

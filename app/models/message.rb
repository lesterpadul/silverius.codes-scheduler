class Message < ApplicationRecord
    # - when initialized, if has no value -> get the time 24 hours from now instead!
    after_initialize do
        self.status ||= 1
    end
end
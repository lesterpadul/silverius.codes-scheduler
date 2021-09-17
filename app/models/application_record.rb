class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    def self.schedule_status 
        return {
            0 => "SCHEDULED",
            1 => "ONGOING",
            2 => "DONE",
            3 => "FAIL"
        }
    end
    
    def self.schedule_repeating_event
        return {
            0 => "NOT REPEATING",
            1 => "REPEATING"
        }
    end
end

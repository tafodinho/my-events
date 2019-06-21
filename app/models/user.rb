class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id", class_name: "Event"
    has_many :user_events, class_name: "UserEvent", foreign_key: "attendee_id"
    has_many :attended_events, through: :user_events, source: :attended_event
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    def previous_events
      attended_events.where('date < :current_date',
                            current_date: DateTime.now)
    end
  
    def upcoming_events
      attended_events.where('date >= :current_date',
                            current_date: DateTime.now)
    end
    
end

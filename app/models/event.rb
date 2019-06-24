class Event < ApplicationRecord
  scope :past, lambda { where("date < ?", Time.zone.now) }
  scope :upcoming, lambda { where("date >= ?", Time.zone.now) }

  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  has_many :user_events, class_name: "UserEvent", foreign_key: "attended_event_id"
   
  has_many :attendees, through: :user_events, source: :attendee

  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true

  
end

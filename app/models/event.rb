class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  has_many :user_events, class_name: "UserEvent", foreign_key: "attendee_id"
   
  has_many :attendees, through: :user_events, source: :attendee

  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true

  def past
    return date if date < Time.zone.now
  end

  def upcoming 
    return date if date > Time.zone.now
  end
end

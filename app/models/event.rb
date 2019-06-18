class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"


  validates :title, presence: true
  validates :venue, presence: true 
  validates :date, presence: true
end

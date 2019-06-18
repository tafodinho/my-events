class Event < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :venue, presence: true 
  validates :date, presence: true
end

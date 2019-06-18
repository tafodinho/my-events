class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id", class_name: "Event"
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password
end

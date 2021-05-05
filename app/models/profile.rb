class Profile < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :escape_rooms, through: :reviews
    has_one_attached :avatar

    def name 
        self.user.username
    end
end

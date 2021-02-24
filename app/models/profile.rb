class Profile < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :escape_rooms, through: :reviews

end

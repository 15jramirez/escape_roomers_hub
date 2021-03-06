class EscapeRoom < ApplicationRecord
    has_many :reviews
    has_many :profiles, through: :reviews
    validates :title, presence:true

    scope :online, ->{where(location: "online")}

end

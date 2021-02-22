class Review < ApplicationRecord
    belongs_to :profile
    belongs_to :escape_room
end

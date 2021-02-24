class Review < ApplicationRecord
    belongs_to :profile
    belongs_to :escape_room

       def escape_rooms_attributes=(attr)
        if attr.blank?
        self.escape_room = EscapeRoom.find_or_create_by(title: attr[:title], location: attr[:location], difficulty: attr[:difficulty], hours: attr[:hours])
        end
    end
end

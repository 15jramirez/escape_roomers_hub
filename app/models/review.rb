class Review < ApplicationRecord
    belongs_to :profile
    belongs_to :escape_room
    #no acceptsnested as not checks for duplicates
    def escape_room_attributes=(attr)
        binding.pry
        #associating room to this review
        if !attr[:title].blank?
            self.escape_room = EscapeRoom.find_or_create_by(title: attr[:title])
        end
    end
end

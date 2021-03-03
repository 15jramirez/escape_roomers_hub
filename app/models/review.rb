class Review < ApplicationRecord
    belongs_to :profile
    belongs_to :escape_room
    validates :title, presence:true
    validates :content, presence:true
    validates :rating, presence:true

       def escape_room_attributes=(attr)
         if !attr[:title].blank?
            self.escape_room = EscapeRoom.find_or_create_by(title: attr[:title], description: attr[:description], location: attr[:location], hours: attr[:hours], difficulty: attr[:difficulty])
         end
       end
    end
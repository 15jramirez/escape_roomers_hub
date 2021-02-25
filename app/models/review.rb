class Review < ApplicationRecord
    belongs_to :profile
    belongs_to :escape_room
    validates :title, presence:true
    validates :content, presence:true
    validates :rating, presence:true

       def escape_room_attributes=(attr)
        self.escape_room = EscapeRoom.find_or_create_by( title: attr[:title], location: attr[:location], difficulty: attr[:difficulty], hours: attr[:hours], description: attr[:description])
       end
    end
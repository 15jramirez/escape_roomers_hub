class EscapeRooms < ApplicationController
    def index 
        @escape_rooms = EscapeRooms.all
    end
end
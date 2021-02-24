class EscapeRooms < ApplicationController
    def index 
        @escape_rooms = EscapeRooms.all
    end
    
    def show 
        @escaperoom = EscapeRooms.find_by(params[:id])
    end

    private
        def find_escape_room
            @escaperoom = EscapeRooms.find_by(params[:id])
        end
end
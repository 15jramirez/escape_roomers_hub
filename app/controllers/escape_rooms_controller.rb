class EscapeRoomsController < ApplicationController
    def index 
        @escape_rooms = EscapeRoom.all
    end
    
    def show 
        @escaperoom = EscapeRoom.find_by(id:params[:id])
    end
       
end
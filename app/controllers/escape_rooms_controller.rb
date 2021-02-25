class EscapeRoomsController < ApplicationController
    def index 
        @escape_rooms = EscapeRoom.all
    end
    
    def show 
        @escaperoom = EscapeRoom.find_by(params[:id])
    end

    private
       
end
class EscapeRoomsController < ApplicationController
    def online
        @escape_rooms = EscapeRoom.online
    end
    def index   
        @escape_rooms = EscapeRoom.all
    end
    
    def show 
        @escaperoom = EscapeRoom.find_by(id:params[:id])
    end
       
end
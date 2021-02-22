class EscapeRoomsController < ApplicationController
    def new 
        #gets new escape room to create if path is coming from user

    end

    def create 
        @escaperoom = EscapeRoom.new()
        if @escaperoom.valid?
    end 

    def index 
        if !params[:location].blank?
            @escaperooms = EscapeRoom.where(location: params[:location])
          elsif !params[:diffculty].blank?
            @escaperooms = EscapeRoom.where(diffculty: params[:diffculty])
          else
            # if no filters are applied, show all rooms
            @escaperooms = EscapeRoom.all 
          end
        end
        #able to see all of the escape rooms createed. this will be on the homepage.
        #create scope to view them all order of diffculty?

    end

    def show 
        @escaperoom = EscapeRoom.find_by(params[:id])
        #in view tag link to user of creater of escape room -> able to see creater reviews made, and other escape rooms made?.
        # if have time add in the wish list => users able to add to that esacpe room to them

        # able to create a review about bottom
    end

    def edit 
        #only able to change if user created escape room 
    end

    def update 
        #only update if user created 
    end 

    def delete 
        #only delete if user created
    end

    private 
        def escaperoom_params
            params.require(:escaperoom).permit(:tilte, :location[], :diffculty[], :description,:hours)
        end

end

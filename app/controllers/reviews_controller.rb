class ReviewsController < ApplicationController
    def new 
        @review = Review.new
    end
    def create 
        @review = Review.create(review_params)
    end

    def edit 
    end

    def update 
    end

    def delete 
    end

    private 
        def review_params
            params.require(:review).permit(:content, :title, :escaperoom_id, escape_rooms_attributes:[
                :title,
                :location,
                :difficulty,
                :description,
                :hours
            ])
        end
end

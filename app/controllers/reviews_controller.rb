class ReviewsController < ApplicationController
    def new 
        @review = Review.new
    end
    def create 
        binding.pry
        @review = Review.create(review_params)
    end

    def edit 
    end

    def update 
    end

    def destory
        flash[:notice] = "Review deleted."
        redirect_to profile_path(current_user.profile)
    end

    private 
        def review_params
            params.require(:review).permit(:content, :rating, :escaperoom_id, escape_rooms_attributes:[
                :title,
                :location,
                :difficulty,
                :description,
                :hours
            ])
        end
end

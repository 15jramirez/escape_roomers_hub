class ReviewsController < ApplicationController
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
            params.require(:review).permit(:content, :title, :user_id, :escaperoom_id)
        end
end

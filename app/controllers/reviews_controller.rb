class ReviewsController < ApplicationController
    def create 
        
    end

    def edit 
    end

    def update 
    end

    def delete 
    end

    private 
        def review_params
            params.require(:review)
        end
end

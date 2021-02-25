class ReviewsController < ApplicationController
    before_action :find_review
    def new 
        #checks if coming from escape room route
        if params[:profile_id] && @profile = Profile.find_by_id(params[:profile_id])
            @review = @profile.reviews.build
        else
          redirect_to login_path  alert: "You need to be logged in to create a review."
        end
    end
    def create 
        @profile = current_user.profile
        @review = @profile.reviews.build(review_params)
        if @review.valid?
            @review.save
            redirect_to profile_review_path(@profile, @review)
        else 
            render :new
        end
    end
    def show 
    end
    def edit 
    end

    def update 
        @review.update(review_params)
        redirect_to profile_review_path(@profile, @review)
    end

    def destory
        flash[:notice] = "Review deleted."
        redirect_to profile_path(current_user.profile)
    end

    private 
        def find_review 
            @review = Review.find_by_id(params[:id])
        end

        def review_params
            params.require(:review).permit( :content, :rating, :escape_room_id[], escape_room_attributes:[
                :title,
                :location,
                :difficulty,
                :description,
                :hours
            ])

        end

        # def redirect_not_owner
        #     if @review.profile != current_user
        #         redirect_to profile_path(current_user.profile), alert: "You can't edit this Review! Nice try."
        #     end
        # end
end

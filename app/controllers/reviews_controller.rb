class ReviewsController < ApplicationController
    before_action :find_review
    before_action :redirect_not_owner, only:[:edit, :update]
    def new 
        #checks if coming from profile room route
        if params[:profile_id] == current_user.profile.id && @profile = Profile.find_by_id(params[:profile_id])
            @review = @profile.reviews.build
        else
            flash[:notice] = "Let's make a review on your profile!"
          redirect_to profile_path(params[:profile_id])
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
        binding.pry
    end

    def edit 
    end

    def update 
        @review.update(review_params)
        redirect_to profile_review_path(@review.profile, @review)
    end

    def destroy
        @review.destroy
        flash[:notice] = "Review deleted."
        redirect_to profile_path(current_user.profile)
    end


    private 
        def find_review 
            @review = Review.find_by_id(params[:id])
        end

        def review_params
            params.require(:review).permit( :title, :rating, :content, :escape_room_id, escape_room_attributes:[
                :title,
                :location,
                :difficulty,
                :description,
                :hours
            ])

        end

        def redirect_not_owner
            if @review.profile.user != current_user
                redirect_to profile_path(@review.profile), alert: "You can't edit this Review! Nice try."
            end
        end
end

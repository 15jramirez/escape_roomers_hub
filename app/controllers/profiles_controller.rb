class ProfilesController < ApplicationController
    before_action :authentication_required
    before_action :find_profile, only:[:show,:edit,:update]

    def show 
    end

    def edit 
        #has to match current user with profile id
    end

    def update
        # @profile.update(profile_params)
    end

    private
        def find_profile
            @profile = Profile.find(params[:id])
        end

        # def profile_params
        #     binding.pry
        #     params.require(:profile).permit(:bio, :user_id)
        # end
end

class ProfilesController < ApplicationController
before_action :authentication_required
before_action :find_profile, only:[:show,:edit,:update]

    def show 
      
    end

    def edit
         if !valid?
            redirect_to profile_path
         else
            render :edit
         end
    end

    def update
        @profile.avatar.attach(params[:avatar])
     
        if valid?
            current_user.profile.update(profile_params)
            redirect_to profile_path(@profile)
        else
            render :edit
        end
    end
    private
        def find_profile
            @profile = Profile.find(params[:id])
        end

        def valid?
            @profile.user.id == current_user.id
        end

        def profile_params
            params.require(:profile).permit(:bio, :user_id, :avatar)
        end
    end
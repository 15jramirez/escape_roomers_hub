class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id 
            binding.pry
            # redirect_to new_profile(@user.profile) notice: "Thank you for signing up!"
        else 
            render :new
        end
    end

    private 
        def user_params 
            params.require(:user).permit(:username,:password)
        end
end

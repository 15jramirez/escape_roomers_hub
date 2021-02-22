class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.save 
            session[:user_id] = user.id
            redirect_to profile_path(current_user.profile)
        else
            flash.now[:alert] = "Account not found"
            redirect_to login_path
        end
    end

    def create 
      user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to profile_path(current_user.profile)
            else
                flash.now[:alert] = "Account not found. Try fix username or password"
                render :new 
            end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

    private 
        def auth 
            request.env['omniauth.auth']
        end
end

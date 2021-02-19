class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
                #user logged in via 3rd  party.
        else
         user = User.find_by(params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to ()
            else
                flash.now[:alert] = "Account was not found"
                render :new 
            end
        end
    end

    def destory 
        reset_session
        redirect_to login_path
    end
end

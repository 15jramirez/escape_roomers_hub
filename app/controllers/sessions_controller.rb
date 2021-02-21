class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.save 
            session[:user_id] = user.id
            redirect_to 
        else
            flash.now[:alert] = "Account not found"
            redirect_to login_path
        end
    end

    def create 
         user = User.find_by(params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to ()
            else
                flash.now[:alert] = "Account not found"
                render :new 
            end
    end

    def destory 
        sessions.delete(:user_id)
        redirect_to login_path
    end

    private 
        def auth 
            request.env['omniauth.auth']
        end
end

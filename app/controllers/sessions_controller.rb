class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
              raise auth_hash.inspect
        else
         user = User.find_by(params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to ()
            else
                flash.now[:alert] = "Account not found"
                render :new 
            end
        end
    end

    def destory 
        redirect_to login_path
    end
end

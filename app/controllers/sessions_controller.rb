class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def omniauth
        byebug
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider'] ) do |u|
            u.username = auth['info']['nickname']
            u.password = SecureRandom.hex(12)
        end
        if user.save 
            session[:user_id] = user.id
            redirect_to 
        else
            redirect_to '/'
        end
    end

    def create 
         user = User.find_by(params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to ()
            else
                flash.now[:alert] = "Account not found"
                render :new 
            end
    end

    def destory 
        redirect_to login_path
    end

    private 
        def auth 
            request.env['omniauth.auth']
        end
end

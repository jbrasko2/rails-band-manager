class SessionController < ApplicationController
    before_action :verified_manager, only: [:destroy]

    def new
        @manager = Manager.new
    end

    def create
        manager = Manager.find_by(username: params[:session][:username])
        if manager.valid?
            session[:manager_id] = manager.id
            redirect_to manager_path(manager)
        else
            flash[:message] = "Invalid username/password combination"
            redirect_to signin_path
        end
    end

    def omniauth

        manager = Manager.create_from_omniauth(auth)
        if manager.valid?
            session[:manager_id] = manager.id
            redirect_to manager_path(manager)
        else
            redirect_to root_path
        end
    end

    def destroy
        session.delete("manager_id")
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
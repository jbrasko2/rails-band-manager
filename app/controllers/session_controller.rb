class SessionController < ApplicationController
    skip_before_action :verified_manager, only: [:new, :create]

    def new
        @manager = Manager.new
    end

    def create
        manager = Manager.find_by(username: params[:session][:username])
        if manager && manager.authenticate(params[:session][:password])
            session[:manager_id] = manager.id
            redirect_to manager_path(manager)
        else
            flash[:message] = "Invalid username/password combination"
            redirect_to signin_path
        end
    end

    def destroy
        session.delete("manager_id")
        redirect_to root_path
    end
end
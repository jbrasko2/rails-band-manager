class SessionController < ApplicationController
    skip_before_action :verified_manager, only: [:new, :create]

    def new
        @manager = Manager.new
    end

    def create
        @manager = Manager.find_by(username: params[:username])
        if @manager && @manager.authenticate(params[:password])
            session[:manager_id] = @manager.id
            redirect_to manager_path(@manager)
        else
            redirect_to '/signin'
        end
    end

    def destroy
        session.delete("manager_id")
        redirect_to root_path
    end
end
class SessionController < ApplicationController
    skip_before_action :verified_manager, only: [:new, :create]
    def new
        @manager = Manager.new
    end

    def create
        if @manager = Manager.find_by(username: params[:manager][:username])
            session[:manager_id] = @manager.id
            redirect_to manager_path(@manager)
        else
            render 'new'
        end
    end

    def destroy
        session.delete
        redirect_to root_path
    end
end
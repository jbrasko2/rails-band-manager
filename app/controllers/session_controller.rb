class SessionController < ApplicationController
    skip_before_action :verified_manager, only: [:new, :create]

    def new
        @manager = Manager.new
    end

    # def create
    #     manager = Manager.find_by(username: params[:manager][:username])
    #     manager = manager.try(:authenticate, params[:manager][:password])

    #     return redirect_to(controller: 'session', action: 'new') unless manager
    #     session[:manager_id] = manager.id
    #     @manager = manager
    #     redirect_to manager_path(@manager)
    # end

    def create
        manager = Manager.find_by(username: params[:manager][:username])
        if manager && manager.authenticate(params[:manager][:password])
            session[:manager_id] = manager.id
            @manager = manager
            redirect_to manager_path(@manager)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.delete("manager_id")
        redirect_to root_path
    end
end
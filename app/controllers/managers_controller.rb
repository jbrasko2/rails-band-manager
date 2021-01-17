class ManagersController < ApplicationController

    def new
      @manager = Manager.new
    end
  
    def create
      manager = Manager.create(manager_params)
      if manager.save
        session[:manager_id] = manager.id
        redirect_to manager_path(manager)
      else
        render 'new'
      end
    end
  
    def show
      @manager = Manager.find_by(id: params[:id])
    end
  
    private
  
    def manager_params
      params.require(:manager).permit(
        :username,
        :email,
        :password,
      )
    end
end

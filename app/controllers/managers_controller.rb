class ManagersController < ApplicationController

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.create(manager_params)
    if @manager.save
      session[:manager_id] = @manager.id
      redirect_to manager_path(@manager)
    else
      render 'new'
    end
  end

  def show
    @manager = Manager.find_by(id: session[:manager_id])
    @bands = @manager.bands
  end

  def edit
    @manager = Manager.find_by(id: session[:manager_id])
  end

  def update
    @manager = Manager.find_by(id: session[:manager_id])
    @manager.update(manager_params)
    if @manager.save
      redirect_to manager_path
    else
      render :edit
    end
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

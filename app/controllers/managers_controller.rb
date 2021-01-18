class ManagersController < ApplicationController
  skip_before_action :verified_manager, only: [:new, :create]

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.create(manager_params)
    if @manager.save
      session[:manager_id] = @manager.id
      redirect_to manager_path(@manager)
    else
      render :new
    end
  end

  def show
    @manager = current_manager
    @bands = @manager.bands
  end

  def edit
    @manager = current_manager
  end

  def update
    @manager = current_manager
    @manager.update(manager_params)
    if @manager.save
      redirect_to manager_path
    else
      render :edit
    end
  end

  def index
    @managers = Manager.all
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

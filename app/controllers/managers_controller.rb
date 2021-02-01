class ManagersController < ApplicationController
  skip_before_action :verified_manager, only: [:new, :create]
  before_action :get_manager, only: [:show, :edit, :update, :destroy]

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      session[:manager_id] = @manager.id
      redirect_to manager_path(@manager)
    else
      render :new
    end
  end

  def show
    @bands = @manager.bands.ordered_by_name
  end

  def edit
  end

  def update
    if @manager.update(manager_params)
      redirect_to manager_path
    else
      render :edit
    end
  end

  def index
    @managers = Manager.all
  end

  def destroy
    @manager.destroy
    redirect_to root_path
  end

  private

  def manager_params
    params.require(:manager).permit(
      :username,
      :email,
      :password,
    )
  end

  def get_manager
    @manager = current_manager
  end
end

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_manager
    helper_method :current_manager, :manager_bands
  
    private
  
    def verified_manager
      redirect_to '/' unless signed_in?
    end
  
    def signed_in?
      !!current_manager
    end
  
    def current_manager
      @current_manager ||= Manager.find_by(id: session[:manager_id])
    end

    def manager_bands
      current_manager.bands
    end
  end

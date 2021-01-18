class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # before_action :verified_manager
    # helper_method :current_manager
  
    # private
  
    # def verified_manager
    #   redirect_to '/' unless manager_is_authenticated
    # end
  
    # def manager_is_authenticated
    #   !!current_manager
    # end
  
    # def current_manager
    #   Manager.find_by(id: session[:manager_id])
    # end
  end

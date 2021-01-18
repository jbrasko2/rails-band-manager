class StaticController < ApplicationController
    skip_before_action :verified_manager
    def home
    end
    
end
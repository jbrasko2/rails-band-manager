class BandsController < ApplicationController

    def index
        @bands = current_manager.bands
    end

    
end

class BandsController < ApplicationController

    def index
        @bands = current_manager.bands
    end

    private

    def band_params
        params.require(:band).permit(:title, :description)
    end
end

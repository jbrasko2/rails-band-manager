class BandsController < ApplicationController

    def index
        @bands = current_manager.bands
    end

    def show
        @band = current_manager.bands.find_by(id: params[:id])
        if !@band
            redirect_to manager_path(current_manager)
        end
    end

    def new
        @band = Band.new
    end

    def create
        @band = current_manager.bands.build(band_params)

        if @band.save
            redirect_to bands_path
        else
            render :new
        end
    end

    private

    def band_params
        params.require(:band).permit(:name, :manager_id)
    end
end

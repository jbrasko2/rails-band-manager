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

    def edit
        @band = current_manager.bands.find_by(id: params[:id])
        if !@band
            redirect_to bands_path
        end
    end

    def update
        @band = current_manager.bands.find_by(id: params[:id])
        @band.update(band_params)
        redirect_to band_path
    end

    def destroy
        @band = current_manager.bands.find_by(id: params[:id])
        @band.destroy
        redirect_to manager_path(current_manager)
    end

    private

    def band_params
        params.require(:band).permit(:name, :manager_id)
    end
end

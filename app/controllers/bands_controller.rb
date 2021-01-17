class BandsController < ApplicationController

    def new
        @band = Band.new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_path(@band)
        else
            render :new
        end
    end

    def index
        @bands = Band.all
    end

    def show
        @band = Band.find_by(id: params[:id])
    end

    def edit
        @band = Band.find_by(id: params[:id])
    end

    def update
        @band = Band.find_by(id: params[:id])
        @band.update(band_params)
        redirect_to band_path(@band)
    end

    private

        def band_params
            params.require(:band).permit(:name, :manager_id)
        end

end

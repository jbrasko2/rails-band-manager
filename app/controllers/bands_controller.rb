class BandsController < ApplicationController
    before_action :get_band, only: [:show, :edit, :update, :destroy]

    def index
        @manager = current_manager
        if params[:name]
            @bands = manager_bands.search(params[:name])
        else 
        @bands = current_manager.bands
        end
    end

    def show
        if !@band
            flash[:message] = "Access Denied. That band is managed by someone else."
            redirect_to bands_path
        end
    end

    def new
        @band = Band.new
    end

    def create
        @band = manager_bands.build(band_params)

        if @band.save
            redirect_to band_path(@band)
        else
            render :new
        end
    end

    def edit
        if !@band
            flash[:message] = "Access Denied. That band is managed by someone else."
            redirect_to bands_path
        end
    end

    def update
        if @band.update(band_params)
            redirect_to manager_band_path(current_manager, @band)
        else
            render :edit
        end
    end

    def destroy
        @band.destroy
        redirect_to bands_path
    end

    private

    def band_params
        params.require(:band).permit(:name, :manager_id, member_ids:[], members_attributes: [:name])
    end

    def get_band
        @band = manager_bands.find_by(id: params[:id])
    end
end

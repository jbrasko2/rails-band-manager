class BandsController < ApplicationController
    before_action :get_band, only: [:show, :edit, :update, :destroy]

    def index
        @manager = current_manager
        @bands = manager_bands.ordered_by_name
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
            redirect_to band_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @band.update(band_params)
        if @band.save
            redirect_to band_path
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

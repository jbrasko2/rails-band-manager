class BandMembersController < ApplicationController
    before_action :get_band_member

    def edit
        @member = Member.find_by(id: @band_member.member_id)
    end

    def update
        if @band_member.update(band_member_params)
            redirect_to band_path(@band_member.band)
        else
            render :edit
        end
    end

    private

    def band_member_params
        params.require(:band_member).permit(:instrument)
    end

    def get_band_member
        @band_member = BandMember.find_by(id: params[:id])
    end
end

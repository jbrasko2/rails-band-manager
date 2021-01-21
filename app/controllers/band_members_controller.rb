class BandMembersController < ApplicationController

    def edit
        @band_member = BandMember.find_by(id: params[:id])
        @member = Member.find_by(id: @band_member.member_id)
    end

    def update
        @band_member = BandMember.find_by(id: params[:id])
        @band_member.update(band_member_params)
        redirect_to band_path(@band_member.band)
    end

    private

    def band_member_params
        params.require(:band_member).permit(:instrument)
    end

end

class BandMembersController < ApplicationController

    def edit
        @band_member = BandMember.find_by(id: params[:id])
        @member = Member.find_by(id: @band_member.member_id)
    end

    def update
        @band_member = BandMember.find_by(id: params[:id])
        @band_member.update(band_member_params)
        if @band_member.save
            redirect_to band_path(@band_member.band)
        else
            render :edit
        end
    end

    private

    def band_member_params
        params.require(:band_member).permit(:instrument)
    end

end

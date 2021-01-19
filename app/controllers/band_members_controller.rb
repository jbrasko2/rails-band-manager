class BandMembersController < ApplicationController

    def new
        @band_member = BandMember.new
    end

    def create
        @band_member = BandMember.create(band_member_params)
    end

    private

    def band_member_params
        params.require(:band_member).permit(:instrument, :band_id, :member_id, member_attributes:[:name])
    end
end

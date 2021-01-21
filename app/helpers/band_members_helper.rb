module BandMembersHelper

    def get_band_member(member, band)
        BandMember.find_by(member_id: member.id, band_id: band.id)
    end

end
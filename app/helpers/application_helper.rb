module ApplicationHelper

    def get_instrument(member, band)
        BandMember.find_by(member_id: member.id, band_id: band.id).instrument
    end
end

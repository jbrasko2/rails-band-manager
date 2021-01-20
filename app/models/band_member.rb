class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :member
  validates_uniqueness_of :member_id, scope: :band_id
end

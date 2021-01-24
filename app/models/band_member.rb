class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :member
  validates :member_id, uniqueness: { scope: :band, message: "has already been taken." }
  
end

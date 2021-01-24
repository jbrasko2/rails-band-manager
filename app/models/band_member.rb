class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :member
  
end

class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :member
  accepts_nested_attributes_for :member
  validates :instrument, presence: true
end

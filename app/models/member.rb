class Member < ApplicationRecord
    has_many :band_members
    has_many :bands, through: :band_members
end

class Member < ApplicationRecord
    has_many :band_members, dependent: :destroy
    has_many :bands, through: :band_members
    validates :name, uniqueness: true
end

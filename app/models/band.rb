class Band < ApplicationRecord
  belongs_to :manager
  has_many :band_members
  has_many :members, through: :band_members
  validates :name, presence: true
  validates :name, uniqueness: true
end

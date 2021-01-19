class Band < ApplicationRecord
  belongs_to :manager
  has_many :band_members, dependent: :destroy
  has_many :members, through: :band_members
  accepts_nested_attributes_for :band_members
  validates :name, presence: true
  validates :name, uniqueness: true
end

class Band < ApplicationRecord
  belongs_to :manager
  has_many :band_members, dependent: :destroy
  has_many :members, through: :band_members
  validates :name, presence: true
  validates :name, uniqueness: {scope: :manager, message: 'has already been taken.'}
  scope :ordered_by_name, -> { order(name: :asc) }

  def members_attributes=(member_attributes)
    member_attributes.values.each do |member_attribute|
      if member_attribute["name"].present?
        member = Member.find_or_create_by(member_attribute)
        self.members << member
      end
    end
  end
end

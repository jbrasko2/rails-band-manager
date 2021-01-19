class Manager < ApplicationRecord
    has_secure_password
    has_many :bands, dependent: :destroy
    validates :email, :username, :password, presence: true
    validates :email, :username, uniqueness: true
end

class Manager < ApplicationRecord
    has_secure_password
    has_many :bands, dependent: :destroy
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |m|
            hash = {username: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex(16)}

            m.update(hash)
        end
    end
end

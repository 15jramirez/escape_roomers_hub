class User < ApplicationRecord
    has_one :profile
    has_secure_password
    validates :username, presence:true, uniqueness:true, length:{minimum: 6}
    validates :password, length:{in: 6..20}

    def self.create_from_omniauth(auth)
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider'] ) do |u|
            u.username = auth['info']['nickname']
            u.password = SecureRandom.hex(12)
        end
    end
end

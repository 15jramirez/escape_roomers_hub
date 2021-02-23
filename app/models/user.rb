class User < ApplicationRecord
    has_one :profile, dependent: :destroy #can add this if make a button to delete user account
    after_create :build_profile
    validates :username, presence:true, uniqueness:true, length:{minimum: 6}
    has_secure_password
    # validates :password, length:{in: 6..20}

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['nickname']
            u.password = SecureRandom.hex(12)
        end
    end

    def build_profile
        Profile.create(user: self, bio: "Welcome! Edit  your profile bio to let others know more about you" )
    end
end

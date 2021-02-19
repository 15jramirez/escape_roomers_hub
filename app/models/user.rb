class User < ApplicationRecord
    has_one :profile
    validates :username, presence:true, uniqueness:true, length:{minimum: 6}
    validates :password, length:{in: 6..20}
    has_secure_password
end

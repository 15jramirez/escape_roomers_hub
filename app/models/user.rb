class User < ApplicationRecord
    has_one :profile
    has_secure_password
    validates :username, presence:true, uniqueness:true, length:{minimum: 6}
    validates :password, length:{in: 6..20}

end

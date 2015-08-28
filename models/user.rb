class User < ActiveRecord::Base
    has_many :content

    validates :username, presence: true
    validates :email, presence: true, with: /@/
    validates :password_hash, presence:true
end

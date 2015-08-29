require 'securerandom'

class User < ActiveRecord::Base
    class << self
        def auth(id, uuid)
            user = find_by(id)
            user.uuid_hash == sha1_salt(uuid, user.salt)
        end

        def sha1(to_hash)
            salt = SecureRandom.base64
            [sha1_salt(to_hash, salt), salt]
        end

        def sha1_salt(to_hash, salt)
            Digest::SHA1.hexdigest(to_hash + salt)
        end
    end

    has_many :content

    validates :uuid_hash, presence: true
    validates :salt, presence: true
end

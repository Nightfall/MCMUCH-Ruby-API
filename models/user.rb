require "securerandom"

class User < ActiveRecord::Base
  def uuid=(uuid)
    self.salt = SecureRandom.base64
    self.uuid_hash = Digest::SHA1.hexdigest(uuid + salt)
  end

  has_many :content

  validates :uuid_hash, presence: true
  validates :salt, presence: true
end

require "securerandom"

class User < ActiveRecord::Base
  include ActiveUUID::UUID

  has_many :creations
  has_many :comments

  validates :mojang_uuid, presence: true
  validates :username, presence: true
  validates :role, presence: true, inclusion: { in: %w(user moderator admin) }
  validates :created_at, presence: true
  validates :last_login, presence: true

  def serializable_hash(options = nil)
    options ||= {}
    super({ except: :mojang_uuid }.merge(options))
  end

  after_initialize :defaults
  def defaults
    self.role ||= "user" if self.has_attribute? :role
    self.created_at ||= DateTime.now if self.has_attribute? :created_at
    self.last_login ||= DateTime.now if self.has_attribute? :last_login
  end
end

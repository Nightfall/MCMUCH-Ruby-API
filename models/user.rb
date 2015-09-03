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
end

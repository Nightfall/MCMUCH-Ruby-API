require "securerandom"

class User < ActiveRecord::Base
  self.primary_key = "id"

  has_many :content

  validates :id, presence: true
  validates :username, presence: true
end

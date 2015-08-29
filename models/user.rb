class User < ActiveRecord::Base
  has_many :content

  validates :uuid_hash, presence: true
end

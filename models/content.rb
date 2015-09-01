class Content < ActiveRecord::Base
  self.table_name = "content"
  self.primary_key = "sha1"
  self.inheritance_column = nil

  validates :sha1, format: {
    with: /\A[0-9a-f]{40}\z/,
    message: "has an invalid format"
  }

  validates :title, presence: true
  validates :type, presence: true

  belongs_to :user
  validates :user, presence: true
end

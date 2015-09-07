class Revision < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :creation

  validates :sha1, length: { is: 40 }
  validates :filesize, presence: true
  validates :creation, presence: true
  validates :title, presence: true
  validates :type, presence: true
  validates :created_at, presence: true
end

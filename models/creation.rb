class Creation < ActiveRecord::Base
  belongs_to :user

  has_many :revisions
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public unlisted private) }
  validates :user, presence: true
end

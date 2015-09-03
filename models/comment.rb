class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable

  validates :user, presence: true
  validates :commentable, presence: true

  validates :created_at, presence: true
end

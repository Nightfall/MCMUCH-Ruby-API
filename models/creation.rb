class Creation < ActiveRecord::Base
  belongs_to :user

  has_many :revisions
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public unlisted private) }
  validates :user, presence: true

  def as_json(options = {})
    super(
      {
        except: :user_id,
        include: {
          user: { only: :id }
        }
      }.merge(options)
    )
  end
end

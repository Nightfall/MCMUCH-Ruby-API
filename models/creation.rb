class Creation < ActiveRecord::Base
  belongs_to :user

  has_many :revisions
  has_many :comments

  validates :title, presence: true
  validates :visibility, inclusion: { in: %w(public unlisted private) }
  validates :user, presence: true

  def serializable_hash(options = nil)
    options ||= {}
    super(
      {
        except: :user_id,
        include: {
          user: { only: [:id, :username] }
        }
      }.merge(options)
    )
  end

  after_initialize :defaults
  def defaults
    self.visibility ||= "public" if self.has_attribute? :visibility
    self.tags ||= [] if self.has_attribute? :tags
    self.created_at ||= DateTime.now if self.has_attribute? :created_at
  end

  def comments
    Comment.where(creation: self)
  end
end

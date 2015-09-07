class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable

  validates :user, presence: true
  validates :commentable, presence: true

  validates :created_at, presence: true

  def as_json(options = {})
    super(
      {
        except: [:user_id, :commentable_id, :commentable_type],
        include: {
          user: { only: :id }
        }
      }.merge(options)
    ).tap do |json|
      if self.commentable
        json["parent"] = {
          id: self.commentable.id,
          type: self.commentable.class.name.downcase
        }
      end

      unless self.comments.blank?
        json["children"] = self.comments.as_json.each { |c| c.delete("parent") }
      end
    end
  end
end

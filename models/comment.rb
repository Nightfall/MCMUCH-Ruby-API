class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :creation

  has_ancestry

  validates :user, presence: true
  validates :creation, presence: true

  validates :created_at, presence: true

  def serializable_hash(options = nil)
    options ||= {}
    super({ except: [:user_id, :creation_id, :parent_id, :ancestry] }.merge(options)).tap do |json|
      if options[:full_user]
        json[:user] = user.as_json
      else
        json[:user] = { id: user_id }
      end

      if options[:full_creation]
        json[:creation] = creation.as_json
      else
        json["creation"] = { id: creation_id }
      end

      if parent_id
        if options[:full_parent]
          json[:parent] = parent.as_json
        else
          json["parent"] = { id: parent_id }
        end
      end
    end
  end

  after_initialize :defaults
  def defaults
    self.created_at ||= DateTime.now if self.has_attribute? :created_at
  end
end

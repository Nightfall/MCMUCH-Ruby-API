class Content < ActiveRecord::Base
  self.table_name = "content"
  self.primary_key = "sha1"
  self.inheritance_column = nil

  belongs_to :user

  validates :sha1, format: {
    with: /[0-9a-f]{40}/,
    message: "has an invalid format"
  }

  validates :user, presence: true

  validates :name, presence: true
  validates :type, presence: true

  def user=(user)
    case user
    when User
      super user
    when String
      super User.find_by!(username: user)
    when Integer
      super User.find(user)
    else
      fail "User was set to an invalid type"
    end
  end
end

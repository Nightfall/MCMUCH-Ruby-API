class Content < ActiveRecord::Base
    self.table_name = "content"
    self.primary_key = "sha1"

    belongs_to :user

    validates :sha1, presence: true

    validates :name, presence: true
    validates :type, presence: true
end

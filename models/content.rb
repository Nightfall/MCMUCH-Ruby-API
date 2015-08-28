class Content < ActiveRecord::Base
    self.table_name = "content"
    self.primary_key = "sha1"

    belongs_to :user
end

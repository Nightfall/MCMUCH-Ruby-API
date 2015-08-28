class Content < ActiveRecord::Base
    self.table_name = "content"

    belongs_to :user
end

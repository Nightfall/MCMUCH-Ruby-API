class CreateContent < ActiveRecord::Migration
    def change
        create_table :content, id: false do |t|
            t.binary :sha1, limit: 20, primary_key: true

            t.string :name
            t.text :description

            t.string :type
        end
    end
end

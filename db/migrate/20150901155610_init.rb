class Init < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.uuid :id, primary_key: true
      t.uuid :mojang_uuid

      t.string :username
      t.string :role

      t.datetime :created_at
      t.datetime :last_login
    end

    add_index :users, :mojang_uuid, unique: true
    add_index :users, :username, unique: true

    create_table :content, id: false do |t|
      t.column :sha1, "binary(20) PRIMARY KEY"
      t.integer :filesize

      t.string :title
      t.text :description

      t.string :type
      t.text :tags_json
      t.string :visibility

      t.datetime :created_at

      t.belongs_to :user
    end

    add_index :content, :title
    add_index :content, :type
    # add_index :content, :user

    create_table :comments, id: false do |t|
      t.uuid :id, primary_key: true

      t.belongs_to :content
      t.belongs_to :user
      t.belongs_to :comment

      t.text :comment
      t.integer :rating

      t.datetime :created_at
      t.datetime :edited_at
    end
  end
end

class Init < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.uuid :mojang_uuid

      t.text :username
      t.text :role

      t.datetime :created_at
      t.datetime :last_login
    end

    add_index :users, :mojang_uuid, unique: true
    add_index :users, :username, unique: true

    create_table :creations do |t|
      t.text :title
      t.text :description

      t.text :visibility

      t.belongs_to :user
    end

    add_index :creations, :title
    add_index :creations, :user_id

    create_table :revisions do |t|
      t.text :sha1
      t.integer :filesize

      t.belongs_to :creation

      t.text :title

      t.text :type

      t.column :tags, "text[]"

      t.datetime :created_at
    end

    add_index :revisions, :sha1, unique: true
    add_index :revisions, :creation_id
    add_index :revisions, :type
    execute "CREATE INDEX index_revisions_on_tags ON revisions USING gin (tags);"

    create_table :comments do |t|
      t.belongs_to :user

      t.belongs_to :commentable, polymorphic: true, index: true

      t.text :comment
      t.integer :rating

      t.datetime :created_at
      t.datetime :edited_at
    end

    add_index :comments, :user_id
  end
end

class Init < ActiveRecord::Migration
  def change
    postgre = ActiveRecord::Base.connection.adapter_name.downcase == "postgresql"

    create_table :users do |t|
      t.uuid :mojang_uuid

      t.string :username
      t.string :role

      t.datetime :created_at
      t.datetime :last_login
    end

    add_index :users, :mojang_uuid, unique: true
    add_index :users, :username, unique: true

    create_table :creations do |t|
      t.string :title
      t.text :description

      t.string :visibility

      t.belongs_to :user
    end

    add_index :creations, :title
    add_index :creations, :user_id

    create_table :revisions do |t|
      t.column :sha1, "binary(20)"
      t.integer :filesize

      t.belongs_to :creation

      t.string :type

      if postgre
        t.column :tags, "jsonb"
      else
        t.text :tags_json
      end

      t.datetime :created_at
    end

    add_index :revisions, :sha1, unique: true
    add_index :revisions, :creation_id
    add_index :revisions, :type
    execute "ADD INDEX index_revisions_on_tags ON revisions USING gin (tags);" if postgre

    create_table :comments do |t|
      t.belongs_to :user

      t.belongs_to :revision
      # OR
      t.belongs_to :comment

      t.text :comment
      t.integer :rating

      t.datetime :created_at
      t.datetime :edited_at
    end

    add_index :comments, :user_id
    add_index :comments, :revision_id
    add_index :comments, :comment_id
  end
end

class Init < ActiveRecord::Migration
  def up
    execute %(
      CREATE TABLE "users" (
        "id" blob(16) PRIMARY KEY NOT NULL,
        "username" varchar(16) UNIQUE
      );
    ).squish

    execute %(
      CREATE TABLE "content" (
        "sha1" blob(20) PRIMARY KEY NOT NULL,
        "title" text,
        "description" text,
        "type" varchar(20),
        "user_id" blob(16) NOT NULL,
        FOREIGN KEY("user_id") REFERENCES users("id")
      );
    ).squish

    add_index :content, :title
  end

  def down
    drop_table :content
    drop_table :users
  end
end

CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "mojang_uuid" binary(16), "username" varchar, "role" varchar, "created_at" datetime, "last_login" datetime);
CREATE UNIQUE INDEX "index_users_on_mojang_uuid" ON "users" ("mojang_uuid");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE TABLE "creations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "visibility" varchar, "user_id" integer);
CREATE INDEX "index_creations_on_title" ON "creations" ("title");
CREATE INDEX "index_creations_on_user_id" ON "creations" ("user_id");
CREATE TABLE "revisions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "sha1" binary(20), "filesize" integer, "creation_id" integer, "title" varchar, "type" varchar, "tags_json" text, "created_at" datetime);
CREATE UNIQUE INDEX "index_revisions_on_sha1" ON "revisions" ("sha1");
CREATE INDEX "index_revisions_on_creation_id" ON "revisions" ("creation_id");
CREATE INDEX "index_revisions_on_type" ON "revisions" ("type");
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "commentable_id" integer, "commentable_type" varchar, "comment" text, "rating" integer, "created_at" datetime, "edited_at" datetime);
CREATE INDEX "index_comments_on_commentable_type_and_commentable_id" ON "comments" ("commentable_type", "commentable_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
INSERT INTO schema_migrations (version) VALUES ('20150901155610');


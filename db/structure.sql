CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" binary(16) PRIMARY KEY, "mojang_uuid" binary(16), "username" varchar, "role" varchar, "created_at" datetime, "last_login" datetime);
CREATE UNIQUE INDEX "index_users_on_mojang_uuid" ON "users" ("mojang_uuid");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE TABLE "content" ("sha1" binary(20) PRIMARY KEY, "filesize" integer, "title" varchar, "description" text, "type" varchar, "tags_json" text, "visibility" varchar, "created_at" datetime, "user_id" integer);
CREATE INDEX "index_content_on_title" ON "content" ("title");
CREATE INDEX "index_content_on_type" ON "content" ("type");
CREATE TABLE "comments" ("id" binary(16) PRIMARY KEY, "content_id" integer, "user_id" integer, "comment_id" integer, "comment" text, "rating" integer, "created_at" datetime, "edited_at" datetime);
INSERT INTO schema_migrations (version) VALUES ('20150901155610');


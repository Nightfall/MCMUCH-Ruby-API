class CreateContent < ActiveRecord::Migration
    def up
        # ActiveRecord a shit
        execute %Q{
            CREATE TABLE "content" (
                "sha1" blob(20) PRIMARY KEY NOT NULL,
                "name" varchar,
                "description" text,
                "type" varchar
            )
        }
    end

    def down
        execute %Q{
            DROP TABLE "content"
        }
    end
end

class CreateContent < ActiveRecord::Migration
    def up
        # ActiveRecord a shit
        execute %(
            CREATE TABLE "content" (
                "sha1" blob(20) PRIMARY KEY NOT NULL,
                "name" varchar UNIQUE,
                "description" text,
                "type" varchar
            )
        )
    end

    def down
        execute %(
            DROP TABLE "content"
        )
    end
end

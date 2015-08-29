source "https://rubygems.org"

gem "rake"

gem "sinatra", require: "sinatra/base"
gem "sinatra-contrib"

gem "sinatra-activerecord"
gem "sqlite3"

gem "require_all"

group :development do
  gem "better_errors"
  gem "binding_of_caller"

  gem "rubocop"
end

group :production do
  gem "passenger"
end

group :test do
  gem "rspec"
  gem "rack-test", require: "rack/test"
  gem "database_cleaner"
end

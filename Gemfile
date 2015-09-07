source "https://rubygems.org"

gem "rake"

gem "grape"

gem "grape-activerecord"
gem "pg"

gem "activeuuid"
gem "ancestry"

gem "require_all"

group :development do
  gem "better_errors"
  gem "binding_of_caller"

  gem "rubocop"

  gem "pry"
  gem "gist"
end

group :production do
  gem "passenger"
end

group :test, :development do
  gem "rspec"
  gem "rack-test", require: "rack/test"
  gem "database_cleaner"

  gem "simplecov", require: false
  gem "simplecov-summary", require: false, github: "inossidabile/simplecov-summary"
end

group :test do
  gem "codecov", require: false
end

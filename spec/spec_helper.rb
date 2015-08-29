ENV["RACK_ENV"] = "test"
require_relative "../config/setup"

RSpec.configure do |c|
  c.include Rack::Test::Methods

  c.around(:each) do |test|
    DatabaseCleaner.cleaning { test.run }
  end
end

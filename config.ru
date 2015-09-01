require_relative "config/setup.rb"

use ActiveRecord::ConnectionAdapters::ConnectionManagement

if ENV["RACK_ENV"] == "development"
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

run Rack::URLMap.new(
  "/api/v1" => APIv1.new
)

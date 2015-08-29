require_relative "config/setup.rb"

run Rack::URLMap.new(
  "/api/v1" => APIv1.new
)

require_relative "api/v1"

run Rack::URLMap.new(
    "/api/v1" => APIv1.new
)

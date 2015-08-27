require_relative "api/v1"

use Rack::URLMap.new(
    "/api/v1" => APIv1.new
)

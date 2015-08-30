require "simplecov-summary"

SimpleCov.start do
  formatter SimpleCov::Formatter::SummaryFormatter

  add_filter "/config/"
  add_filter "/spec/"
  add_filter "/db/"

  add_group "api:v1", "api/v1.rb"
  add_group "models", "models"
  add_group "helpers", "helpers"

  merge_timeout 3600
end

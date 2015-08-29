require_relative "config/setup"
require "sinatra/activerecord/rake"
require "rspec/core/rake_task"

ENV["SIMPLECOV_NO_DEFAULTS"] = "true"
require "simplecov"

RSpec::Core::RakeTask.new :spec

desc "Push coverage data to codecov"
task "spec:codecov": [:spec] do
  require "codecov"
  SimpleCov::Formatter::Codecov.new.format(SimpleCov.result)
end

desc "Generates a HTML report of SimpleCov data"
task "spec:html_report": [:spec] do
  require "simplecov-html"
  SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)
end

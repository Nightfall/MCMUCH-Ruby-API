require_relative "config/setup"
require "grape/activerecord/rake"
require "rspec/core/rake_task"

ENV["SIMPLECOV_NO_DEFAULTS"] = "true"
require "simplecov"
ENV["SIMPLECOV_NO_DEFAULTS"] = nil

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

task ci: ["db:migrate", "spec", "spec:codecov"]

namespace :grape do
  desc "Print compiled grape routes"
  task :routes do
    class API < Grape::API
      mount APIv1
    end
    API.routes.each do |route|
      version = route.route_version ? "(#{route.route_version}) " : ""
      puts "#{version}#{route.route_method} #{route.route_path}"
    end
  end
end

ENV["RACK_ENV"] ||= "development"

require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"])

Sinatra::Base.set :database_file, __dir__ + "../config/database.yml"

require_relative "../api/v1"

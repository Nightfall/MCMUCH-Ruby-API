ENV["RACK_ENV"] ||= "development"

require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"])

Grape::ActiveRecord.database_file = __dir__ + "/../config/database.yml"
ActiveRecord::Base.schema_format = :sql

require_all __dir__ + "/../models"
# require_all __dir__ + "/../helpers"
require_all __dir__ + "/../api"

POSTGRE = ActiveRecord::Base.connection.adapter_name.downcase == "postgresql"

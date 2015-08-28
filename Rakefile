require_relative "config/setup"
require "sinatra/activerecord/rake"

db_conf = YAML.load_file(File.expand_path("../config/database.yml", __FILE__))
ActiveRecord::Tasks::DatabaseTasks.database_configuration = db_conf

namespace :db do
    task :load_config do
        Dir[__dir__ + "/models/.rb"].each {|file| require file }
    end
end

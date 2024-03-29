ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'dotenv'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load if ENV['SINATRA_ENV'] == "development"

set :database_file, "./database.yml"

require './app/controllers/application_controller'
require_all 'app'

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

Dotenv.load # we generated a "secret" and put it equal to SESSION_SECRET in .env 
# now we can load the environment variable (SESSION_SECRET), from the .env file,
# into our app with the Dotenv.load method 

require './app/controllers/application_controller'
require_all 'app'

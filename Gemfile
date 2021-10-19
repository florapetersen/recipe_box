source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', "< 6", :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'tux'
gem 'sinatra-flash'
gem 'rails_12factor'
gem 'foreman'
#gem 'dotenv'
gem 'pg', '0.20'

group :development, :test do 
  gem 'sqlite3', '<1.4'
  gem 'shotgun'
  gem 'tux'
  gem 'pry'
  gem 'session_secret_generator'
  gem 'dotenv-rails'
end

group :production do 

end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

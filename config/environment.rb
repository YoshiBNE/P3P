require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
)

require_relative '../app/model/user'
require_relative '../app/model/country'
require_relative '../app/model/suburb'
require_relative '../app/cli'
require_relative '../app/greeting'
require_relative '../app/weather'
require_relative '../app/user_details'
require_relative '../app/getrequester'
require_relative '../app/get_rapidapi'
require_relative '../app/age'
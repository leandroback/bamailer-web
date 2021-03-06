# Bundler
require 'bundler'

# Include required gems
%w{ sinatra/base rack-flash haml rack/recaptcha sinatra/contrib sinatra/content_for mongoid shield 
  sinatra/reloader sinatra/partial multimap rest-client }.each{ |req| require req }

# Require app code
Dir['app/models/*.rb'].sort.each { |req| require_relative req }
Dir['app/*.rb'].sort.each { |req| require_relative req }
Dir["app/routes/**/*.rb"].sort.each { |req| require_relative req }
Dir['app/routes/*.rb'].sort.each { |req| require_relative req }
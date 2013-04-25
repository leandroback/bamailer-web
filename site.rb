# encoding: utf-8
require 'rack-protection'
require 'haml'
require 'ost'
require 'ohm'
require 'ohm/contrib'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/content_for'
require 'sinatra/config_file'
require 'rack-flash'
require 'shield'

# Load models
Dir['./app/models/*.rb'].each do |file|
  require file
end

module Bamailer
  class Main < Sinatra::Base

    use Shield::Middleware

    helpers Shield::Helpers

    Ohm.connect(host: 'localhost', port: 6379, db: 0)

    # Load routes
    Dir['./app/routes/**/*.rb'].each do |file|
      require file
    end

    get '/' do
      run Rack::Cascade.new [Guests]
    end


    #on authenticated(User) do
    #  run Users
    #end

    #on  authenticated(Admin) do
    #  run Admins
    #end

  end
end

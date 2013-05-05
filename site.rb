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
require 'sinatra/namespace'
require 'rack-flash'
require 'shield'

# Load models
Dir['./app/models/*.rb'].each do |file|
  require file
end

module Bamailer
  class Main < Sinatra::Base
    register Sinatra::Namespace
    use Shield::Middleware
    helpers Shield::Helpers

    configure :production, :development do
      #enable :loggin
      set :haml, {:format => :html5} # default Haml format is :xhtmlg
    end

    Ohm.connect(host: 'localhost', port: 6379, db: 0)

    # Load routes (here /admins and /users)
    Dir['./app/routes/**/*.rb'].each do |file|
      require file
    end

    # Public methods
    get '/' do
      redirect '/public'
    end

    get '/login' do
      haml :'public/login', layout: :'public/layout'
    end

    get '/logout' do
    end
  end
end

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
    get '/' do
      "hello world!"
    end
  end
end

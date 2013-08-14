module Bamailer
  class Base < Sinatra::Base
    set :root, Dir.pwd
    set :haml,   :format => :html5
    set :public_folder, File.dirname(__FILE__) + '/public'

    register Sinatra::Partial
    set :partial_template_engine, :haml
    enable :partial_underscores
    # use Rack::Flash, :accessorize => [:notice, :error]
    use Rack::Static, urls: ['/css', '/img', '/js'], root: 'public'

    configure :development do
      register Sinatra::Reloader
    end
    
    configure do
    end

    # These will be available for all MyApp subclasses
    helpers do
    end

    Mongoid.load!('./config/mongoid.yml', :development)

    #FIXME: make a view
    not_found do
      "Not Found Base"
    end

    #FIXME: make a view
    error do
      "Error Base"
    end
  end
end
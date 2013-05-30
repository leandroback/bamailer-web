module MyApp
  # Setup sinatra configuration
  class Base < Sinatra::Base

    configure do
      # set :raise_errors, false
      # set :dump_errors, true
      # set :methodoverride, true
      # set :show_exceptions, false
      # set :static, true
      # set :static_cache_control, [:public, :max_age => 1800]
      # set :logging, true
      # set :public_folder, 'public'
      # enable :logging
    end

    # These will be available for all MyApp subclasses
    helpers do
    end

    Ohm.connect(host: 'localhost', port: 6379, db: 0)

    not_found do
      "Not Found"
    end

    error do
      "Error"
    end
  end
end
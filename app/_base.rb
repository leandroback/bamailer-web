module MyApp
  class Base < Sinatra::Base
    configure do
    end

    # These will be available for all MyApp subclasses
    helpers do
    end

    Mongoid.load!('./config/mongoid.yml', :development)

    #FIXME: make a view
    not_found do
      "Not Found"
    end

    #FIXME: make a view
    error do
      "Error"
    end
  end
end
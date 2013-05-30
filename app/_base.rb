module MyApp
  class Base < Sinatra::Base
    configure do
    end

    # These will be available for all MyApp subclasses
    helpers do
    end

    Ohm.connect(host: 'localhost', port: 6379, db: 0)

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
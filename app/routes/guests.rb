class Guests < Sinatra::Base
  set prefix: '/guests'

  get '/' do
    "Hello Guest"
  end
end

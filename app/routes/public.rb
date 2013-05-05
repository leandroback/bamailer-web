module Bamailer
  class Main < Sinatra::Base
    namespace '/public' do
      get do
        'public!'
      end
    end
  end
end

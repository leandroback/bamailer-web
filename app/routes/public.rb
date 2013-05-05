module Bamailer
  class Main < Sinatra::Base
    namespace '/public' do
      set :views, File.expand_path('../../../views/public', __FILE__)
      get do
        haml :index, layout: :layout
      end
    end
  end
end

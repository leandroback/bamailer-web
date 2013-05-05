module Bamailer
  class Main < Sinatra::Base
    namespace '/admins' do
      before { error(401) unless authenticated(User) }
    end
  end
end

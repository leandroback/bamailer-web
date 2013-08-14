module Bamailer
  class AdminApp
    get '/sessions/login' do
      haml :login, layout: :layout
    end

    post '/sessions/login' do
      UserAdmin.authenticate(params[:email], params[:password])
    end
  end
end
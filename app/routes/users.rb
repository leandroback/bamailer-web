class MyApp::UserApp < MyApp::Base
  get '/login' do
    haml :login
  end

  get "/" do
    error(401) unless authenticated(User)
  end
end
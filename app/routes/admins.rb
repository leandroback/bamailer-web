class MyApp::AdminApp < MyApp::Base
  get '/sessions/login' do
    haml :login
  end
end
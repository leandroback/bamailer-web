class MyApp::AdminApp < MyApp::Base
  get '/sessions/login' do
    haml :login, layout: :layout
  end
end
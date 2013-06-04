class MyApp::UserApp < MyApp::Base
  get '/sessions/login' do
    haml :login, layout: :layout
  end
end
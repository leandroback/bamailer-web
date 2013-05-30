class MyApp::AdminApp < MyApp::Base
  get '/login' do
    haml :login
  end

  # get '/admin/login' do
  #   haml :login
  # end
end
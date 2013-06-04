class MyApp::AdminApp < MyApp::Base
  get '/sessions/login' do
    haml :login, layout: :layout
  end

  post '/sessions/login' do
    Admin.authenticate(params[:email], params[:password])
  end
end
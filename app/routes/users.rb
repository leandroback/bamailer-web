class MyApp::UserApp < MyApp::Base
  get '/sessions/login' do
    haml :login, layout: :layout
  end

  post '/sessions/login' do
    User.authenticate(params[:email], params[:password])
  end
end
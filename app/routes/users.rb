class MyApp::UserApp < MyApp::Base
  get '/' do
    haml :index
  end
end
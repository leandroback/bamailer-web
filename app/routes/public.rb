class MyApp::PublicApp < MyApp::Base
  get '/' do
    haml :index, layout: :layout
  end
end
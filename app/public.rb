class MyApp::PublicApp < MyApp::Base
  configure do
    set :views, "app/views/public"
  end
end
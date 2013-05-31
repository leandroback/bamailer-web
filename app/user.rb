class MyApp::UserApp < MyApp::Base
  use Shield::Middleware, "/user/sessions/login"
  helpers Shield::Helpers

  configure do
    set :views, "app/views/users"
  end
  
  # Add helpers only needed in user app here
  helpers do
  end
end
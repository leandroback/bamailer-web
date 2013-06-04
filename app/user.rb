class MyApp::UserApp < MyApp::Base
  use Shield::Middleware, "/user/sessions/login"
  helpers Shield::Helpers

  configure do
    set :views, "app/views/users"
  end

  before { error(401) unless authenticated(Admin) || request.path_info == "/sessions/login" }
  
  # Add helpers only needed in user app here
  helpers do
  end
end
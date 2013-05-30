class MyApp::UserApp < MyApp::Base
  use Shield::Middleware, "/user/login"
  helpers Shield::Helpers

  configure do
    set :views, "app/views/user"
  end

  before { error(401) unless authenticated(User) }
  
  # Add helpers only needed in user app here
  helpers do
  end
end
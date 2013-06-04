class MyApp::AdminApp < MyApp::Base
  use Shield::Middleware, "/admin/sessions/login"
  helpers Shield::Helpers
  use Rack::Session::Cookie

  configure do
    set :views, "app/views/admins"
  end

  before { error(401) unless authenticated(Admin) || request.path_info == "/sessions/login" }

  # Add helpers only needed in admin app here
  helpers do
  end
end
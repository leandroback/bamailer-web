class MyApp::AdminApp < MyApp::Base
  use Shield::Middleware, "/admin/login"
  helpers Shield::Helpers
  use Rack::Session::Cookie

  configure do
    set :views, "app/views/admin"
  end

  before { error(401) unless authenticated(User) }

  helpers do
  end
end
class MyApp::AdminApp < MyApp::Base
  use Shield::Middleware
  helpers Shield::Helpers

  before { error(401) unless authenticated(User) }

  configure do
    set :views, "app/views/admin"
  end

  before do
  end

  helpers do
  end
end
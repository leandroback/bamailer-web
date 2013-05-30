class MyApp::UserApp < MyApp::Base
  use Shield::Middleware
  helpers Shield::Helpers

  configure do
    set :views, "app/views/user"
  end

  before do
  end

  # Add helpers only needed in user app here
  helpers do
  end

end
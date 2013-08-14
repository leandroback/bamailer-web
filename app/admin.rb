module Bamailer
  class AdminApp < Bamailer::Base
    use Shield::Middleware, '/admin/sessions/login'
    helpers Shield::Helpers
    use Rack::Session::Cookie

    configure do
      set :views, 'app/views/admins'
    end

    before { require_sign_in }

    # Add helpers only needed in Admin app here
    helpers do
      def current_user
        authenticated(UserAdmin)
      end

      def require_sign_in
        error(401) unless authenticated(UserAdmin) || request.path_info == '/sessions/login'
      end
    end
  end
end
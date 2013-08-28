module Bamailer
  class AdminApp < Bamailer::Base
    use Shield::Middleware, '/admin/sessions/login'
    helpers Shield::Helpers

    configure do
      set :views, 'app/views/admin'
    end

    before { require_sign_in }

    # Add helpers only needed in Admin app here
    helpers do
      def current_user
        authenticated UserAdmin
      end

      def require_sign_in
        error(401) unless authenticated(UserAdmin) || request.path_info == '/sessions/login'
      end
    end

    not_found do
      "not found admin, #{request.path_info}"
    end

    error do
      "error admin"
    end
  end
end
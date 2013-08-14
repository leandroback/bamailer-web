module Bamailer
  class UserApp < Bamailer::Base
    use Shield::Middleware, "/user/sessions/login"
    helpers Shield::Helpers

    configure do
      set :views, "app/views/users"
    end

    before { require_sign_in }

    # Add helpers only needed in User app here
    helpers do
      def current_user
        authenticated(User)
      end

      def require_sign_in
        error(401) unless authenticated(User) || request.path_info == '/sessions/login'
      end
    end
  end
end
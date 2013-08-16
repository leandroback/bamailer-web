module Bamailer
  class PublicApp < Bamailer::Base
    configure do
      set :views, "app/views/public"
    end

    use Rack::Recaptcha, public_key: settings.recaptcha['public_key'], private_key: settings.recaptcha['private_key']
    helpers Rack::Recaptcha::Helpers

    not_found do
      "not found public"
    end

    error do
      "error public"
    end
  end
end
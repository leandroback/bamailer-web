module Bamailer
  class PublicApp < Bamailer::Base
    configure do
      set :views, "app/views/public"
    end

    use Rack::Recaptcha, public_key: settings.recaptcha['public_key'], private_key: settings.recaptcha['private_key']
    helpers Rack::Recaptcha::Helpers
    helpers Sinatra::ContentFor

    not_found do
      haml :'404'
    end

    error do
      "error public"
    end
  end
end
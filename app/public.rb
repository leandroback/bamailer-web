module Bamailer
  class PublicApp < Bamailer::Base
    configure do
      set :views, "app/views/public"
    end

    use Rack::Recaptcha, public_key: '6LdCHuYSAAAAAEOE_WVcEAFYj_kBUINabYzIO469', private_key: '6LdCHuYSAAAAAJ0AEDxLoQ0uLR16o5QPRq0ODgaN'
    helpers Rack::Recaptcha::Helpers

    not_found do
      haml :'404'
    end

    error do
      "error public"
    end
  end
end
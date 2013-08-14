module Bamailer
  class PublicApp < Bamailer::Base
    configure do
      set :views, "app/views/public"
    end

    not_found do
      "not found public"
    end

    error do
      "error public"
    end
  end
end
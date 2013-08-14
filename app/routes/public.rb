module Bamailer
  class PublicApp
    get '/' do
      haml :index
    end

    get '/caracteristicas' do
      haml :caracteristicas
    end

    get '/tutoriales' do
      haml :tutoriales
    end

    get '/contacto' do
      haml :contacto
    end

    get '/condiciones-de-uso' do
      haml :condiciones_de_uso
    end

    get '/politicas-de-privacidad' do
      haml :politicas_de_privacidad
    end

    get '/politicas-de-privacidad-en' do
      haml :politicas_de_privacidad_en
    end
  end
end
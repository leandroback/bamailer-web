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

    get '/servicio' do
      haml :form_servicio
    end

    post '/contacto/new' do
      if recaptcha_valid?
        contact = Contact.new params[:contact]

        begin
          if contact.save
            flash[:notice] = 'Formulario de contacto enviado correctamente'
          else
            flash[:error] = 'Por favor, verifique los datos ingresados'
            redirect :'/contacto'
          end
        rescue Exception => e
          flash[:error] = e.message
          redirect :'/contacto'
        end
      else
        flash[:error] = 'Por favor, verifique el captcha ingresado'
        redirect :'/contacto'
      end

      redirect :'/'
    end

    post '/servicio/new' do
      if recaptcha_valid?
        service_request = ServiceRequest.new params[:service_request]

        begin
          if service_request.save
            flash[:notice] = 'Solicitud de servicio enviada correctamente'
          else
            flash[:error] = 'Por favor, verifique los datos ingresados'
            redirect :'/servicio'
          end
        rescue Exception => e
          flash[:error] = e.message
          redirect :'/servicio'
        end
      else
        flash[:error] = 'Por favor, verifique el captcha ingresado'
        redirect :'/servicio'
      end

      redirect :'/'
    end
  end
end
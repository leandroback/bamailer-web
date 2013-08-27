class SendMail
  def deliver(object)
    # first email, detinated to soporte@backing-online.com
    data = Multimap.new
    data[:from] = object.email
    data[:to] = 'soporte@backing-online.com'
    data[:subject] = object.subject
    data[:html] =  object.body_email
    data["o:tag"] = "Bamailer" #FIXME: esta bien ?

    RestClient.post "https://api:key-5-9kwbqc3twn0mdj4qsdrlm2cv91qvv6"\
    "@api.mailgun.net/v2/bamailer.com.ar/messages", data

    # second email, now destinated to user's email
    data = Multimap.new
    data[:from] = 'soporte@backing-online.com'
    data[:to] = object.email
    data[:subject] = 'Gracias por su Contacto - BAmailer - BACKING S.A.'
    data[:html] =  "Gracias por su contacto, a la brevedad nos comunicaremos con usted. "\
                    "<br><br>Staff de BAmailer"
    data["o:tag"] = "Bamailer" #FIXME: esta bien ?
    
    RestClient.post "https://api:key-5-9kwbqc3twn0mdj4qsdrlm2cv91qvv6"\
    "@api.mailgun.net/v2/bamailer.com.ar/messages", data
  end
end
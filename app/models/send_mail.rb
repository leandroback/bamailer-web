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
    data[:subject] = 'Muchas gracias por contactarse'
    data[:html] =  "Muchas gracias por contactarse con nosotros, a la brevedad nos pondremos "\
                    "en contacto con usted.<br><br>Muchas Gracias<br>Staff BAMailer"
    data["o:tag"] = "Bamailer" #FIXME: esta bien ?
    
    RestClient.post "https://api:key-5-9kwbqc3twn0mdj4qsdrlm2cv91qvv6"\
    "@api.mailgun.net/v2/bamailer.com.ar/messages", data
  end
end
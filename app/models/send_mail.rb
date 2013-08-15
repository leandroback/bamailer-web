class SendMail
  def deliver(object)
    data = Multimap.new
    data[:from] = object.email
    data[:to] = 'soporte@backing-online.com'
    data[:subject] = object.subject
    data[:html] =  object.body_email
    data["o:tag"] = "Bamailer" #FIXME: esta bien ?
    
    RestClient.post "https://api:key-5-9kwbqc3twn0mdj4qsdrlm2cv91qvv6"\
    "@api.mailgun.net/v2/bamailer.com.ar/messages", data
  end
end
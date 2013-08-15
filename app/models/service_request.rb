class ServiceRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :telephone, type: String
  field :emails_to_deliver, type: String

  validates_presence_of :name, :email, :telephone, :emails_to_deliver
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  def subject
    'Bamailer | Solicitud de servicio'
  end

  def body_email
    "Han solicitado el serivicio de bamailer con la siguiente informacion: <br><br>"\
    "Nombre: #{name}<br>"\
    "Email: #{email}<br>"\
    "Telefono: #{telephone}<br>"\
    "Cantidad de emails a enviar: #{emails_to_deliver}"
  end
end
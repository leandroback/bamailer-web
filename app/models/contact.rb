class Contact
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :comment, type: String

  validates_presence_of :name, :email, :comment
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  def subject
    'Bamailer | Mensaje de contacto'
  end

  def body_email
    "Han enviado un mensaje de contacto con la siguiente informacion: <br><br>"\
    "Nombre: #{name}<br>"\
    "Email: #{email}<br>"\
    "Comentario: #{comment}"
  end
end
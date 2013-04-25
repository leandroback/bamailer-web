class User < Ohm::Model
  include Shield::Model

  attribute :email
  index :email

  attribute :crypted_password

  def self.fetch(email)
    find(:email => email).first
  end

end

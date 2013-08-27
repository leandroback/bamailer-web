class UserAdmin
  include Mongoid::Document
  include Shield::Model

  field :email, type: String
  field :crypted_password, type: String

  def self.fetch(email)
    where(email: email).first
  end

  def self.[](id)
    find id
  end
end

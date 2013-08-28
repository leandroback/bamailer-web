class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Shield::Model

  field :email, type: String
  field :crypted_password, type: String

  validates :email, presence: true, uniqueness: true

  def self.fetch(email)
    where(email: email).first
  end

  def self.[](id)
    find id
  end
end

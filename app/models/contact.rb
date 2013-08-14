class Contact
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :comment, type: String

  validates_presence_of :name, :email, :comment
end
class ServiceRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :telephone, type: String
  field :emails_to_deliver, type: String

  validates_presence_of :name, :email, :telephone, :emails_to_deliver
end
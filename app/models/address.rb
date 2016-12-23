class Address
  include Mongoid::Document
  belongs_to :customer
  belongs_to :city

  field :street_address, type: String
end

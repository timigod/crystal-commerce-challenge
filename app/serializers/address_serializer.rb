class AddressSerializer < ActiveModel::Serializer
  attributes :street_address
  has_one :city, serializer: CitySerializer


end

class AddressSerializer < ActiveModel::Serializer
  attributes :street_address
  belongs_to :city, serializer: CitySerializer


end

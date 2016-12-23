class CitySerializer < ActiveModel::Serializer
  attributes :name
  has_one :state, serializer: StateSerializer


end

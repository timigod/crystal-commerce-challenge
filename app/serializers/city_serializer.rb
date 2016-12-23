class CitySerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :state, serializer: StateSerializer


end

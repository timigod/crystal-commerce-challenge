class CustomerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email
  has_many :addresses, serializer: AddressSerializer



end

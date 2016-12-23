require 'json_api_base_serializer'

class SideloadCustomerSerializer < JsonApiSerializer
  attributes :id, :first_name, :last_name, :email, :links

  def links
    @addresses = object.addresses
    @cities = []; @states = []
    @addresses.each { |x| @cities << x.city }
    @cities.each { |x| @states << x.state }

    {
        addresses: @addresses.map(&:id),
        cities: @cities.map(&:id),
        states: @states.map(&:id)
    }
  end

  def attributes
    hash = super

    hash[:linked] = {
        addresses: ActiveModel::ArraySerializer.new(
            @addresses,
            each_serializer: SideloadAddressSerializer
        ).as_json,
        cities: ActiveModel::ArraySerializer.new(
            @cities,
            each_serializer: SideloadCitySerializer
        ).as_json,
        states: ActiveModel::ArraySerializer.new(
            @states,
            each_serializer: SideloadStateSerializer
        ).as_json
    }

    hash
  end
end

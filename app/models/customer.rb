class Customer
  include Mongoid::Document
  has_many :addresses

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


  def self.alternate_sideload
    set_associations
    return serialized_sideload_hash
  end

  private

  def self.set_associations
    @@addresses = Address.where(:customer_id.in => Customer.pluck(:id))
    @@cities = []; @@states = []
    @@addresses.each { |x| @@cities << x.city }
    @@cities.each { |x| @@states << x.state }

    @@addresses.uniq!
    @@cities.uniq!
    @@states.uniq!
  end


  def self.serialized_sideload_hash
    {
        customers: sideload_serialize(Customer.all, AlternateSideloadCustomerSerializer),
        associations: {
            addresses: sideload_serialize(@@addresses, SideloadAddressSerializer),
            cities: sideload_serialize(@@cities, SideloadCitySerializer),
            states: sideload_serialize(@@states, SideloadStateSerializer)
        }

    }
  end

  def self.sideload_serialize(collection, serializer)
    return ActiveModel::ArraySerializer.new(
        collection,
        each_serializer: serializer
    )
  end

end

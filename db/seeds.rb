# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 15 states
15.times do
  State.create(name: Faker::Address.state)
end

# create 40 cities and assign to them a random state
40.times do
  random_state = State.skip(rand(State.count)).first
  City.create(name: Faker::Address.city, state_id: random_state.id)
end


# create 100 customers
100.times do
  customer = Customer.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email
  )

  # create a random number of addresses for a customer and assign to a random city
  rand(1..5).times do
    random_city = City.skip(rand(City.count)).first
    customer.addresses.create(
        street_address: Faker::Address.street_address,
        city_id: random_city.id
    )
  end
end

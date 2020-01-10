# frozen_string_literal: true

ingridients = Ingridient.create([
                                  { name: 'white onion',
                                    description: 'White sort of onion, from local farmer' },
                                  { name: 'red onion',
                                    description: 'As we do not have the budget. Y all only gonna get fucking onions' }
                                ])
tables = Table.create(number: 1, seats: 3, description: 'neat table for three')
organizations = Organization.create(
  name: "Larry's Schnitzel House",
  phone: '+436506300112',
  mail: 'somebody@example.com',
  street: '12 Downing Street',
  town: 'London',
  zipcode: '4210',
  VAT: 'ATU99999999',
  legal_name: 'Larriard Hannes',
  homepage: 'example.com',
  currency: 'EUR'
)
roles = Role.create(name: 'admin')
users = User.create(
  username: 'Jonas Funcke',
  email: 'jonas@funcke.work',
  firstname: 'Jonas',
  lastname: 'Funcke',
  gender: 'male',
  password_digest: BCrypt::Password.create('Litec123!')
)

Right.create(
  name: 'admin'
)

categories = Category.create(
  name: 'noodles'
)
dishes = Dish.create(
  price: 1.25,
  name: "fucking noodles",
  description: "My noodles are good. If you no like them, fuck you",
  ingridients: ingridients,
  category: categories
)
organizations.users << users
organizations.ingridients << ingridients
organizations.roles << roles
organizations.tables << tables
roles.users << users
organizations.categories << categories
organizations.dishes << dishes
puts users.errors.messages
puts organizations.errors.messages
puts roles.errors.messages
puts tables.errors.messages

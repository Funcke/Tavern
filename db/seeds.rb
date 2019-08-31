# frozen_string_literal: true

ingridients = Ingridient.create([
  { name: 'white onion', description: 'White sort of onion, from local farmer'},
  { name: 'red onion', description: 'As we do not have the budget. Y all only gonna get fucking onions'}
])
tables = Table.create(number: 1, seats: 3, description: 'neat table for three, have fun')
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

rights = Right.create({
  name: 'admin'
})

organizations.users << users
organizations.ingridients << ingridients
organizations.roles << roles
organizations.tables << tables
roles.users << users
puts users.errors.messages
puts ingridients.each {|i| puts i.errors.messages}
puts organizations.errors.messages
puts roles.errors.messages
puts tables.errors.messages
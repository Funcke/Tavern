products = Product.create([
    {name: 'Burger', preis: 7.5, food: true},
    {name: 'Kotelett', preis: 6.5, food: true},
    {name: 'Wurst', preis: 4.5, food: true},
    {name: 'Pommes', preis: 2.5, food: true},
    {name: 'Halbe', preis: 3.5, food: false},
    {name: 'Seiterl', preis: 3, food: false},
    {name: 'Gespritzter', preis: 2.5, food: false},
    {name: 'Anti', preis: 2.5, food: false}
])
tables = Table.create({nummer: 1})
organizations = Organization.create({name: 'Jonas´Test Unternehmen'})
roles = Role.create({name: 'admin'})
users = User.create({username: 'Jonas Funcke', email: 'jonas@funcke.work', password_digest: BCrypt::Password.create('Litec123!')})
level = Level.create({name: 'admin'})
organizations.users << users
organizations.roles << roles
organizations.tables << tables
organizations.products << products
roles.users << users
level.roles << roles
puts User.all

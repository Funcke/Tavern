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
User.destroy_all
Invoice.destroy_all

fred = User.create! name: 'fred', phone: '0987654321'
fred.create_address(line1: '301 Cobblestone Way', town: 'bedrock')

batman = User.create! name: 'bruce', phone: '911'
batman.create_address(line1: 'wayne manor', town: 'gotham')

river = User.create! name: 'river', phone: 'miranda'
river.create_address(line1: 'cargo deck', line2: 'serenity')


fred.invoices.create! number: 1, price: 12.33
batman.invoices.create! number: 2, price: 421.76
river.invoices.create! number: 3, price: 12.33
Invoice.create! number: 4, price: 77.22

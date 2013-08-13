User.destroy_all
Invoice.destroy_all

fred = User.create! name: 'fred', address: 'bedrock', phone: '0987654321'
batman = User.create! name: 'bruce', address: 'wayne manor', phone: '911'
river = User.create! name: 'river', address: 'serenity', phone: 'miranda'


fred.invoices.create! number: 1, price: 12.33
batman.invoices.create! number: 2, price: 421.76
river.invoices.create! number: 3, price: 12.33
Invoice.create! number: 4, price: 77.22

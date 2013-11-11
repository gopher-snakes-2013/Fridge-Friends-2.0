user1 = User.create(email: "stevennugent@gmail.com",
                    password: "stevenpassword",
                    phone_number: "206-313-0520",
                    name: "Steven",
                    customer_id: "489478274")

user2 = User.create(email: "annie@gmail.com",
                    password: "anniepassword",
                    phone_number: "555-555-5555",
                    name: "Annie",
                    customer_id: "673198357")

user3 = User.create(email: "cricket@gmail.com",
                    password: "cricketpassword",
                    phone_number: "555-555-5555",
                    name: "Cricket",
                    customer_id: "752856769")

user4 = User.create(email: "carter@gmail.com",
                    password: "carterpassword",
                    phone_number: "555-555-5555",
                    name: "Carter",
                    customer_id: "958265963")

home_fridge = user1.fridges.create(name:"Home")

home_fridge.items.create([{ name: "Milk", category: "Dairy", creator_id: user1.id},
                          { name: "Orange Juice", category: "Beverage", creator_id: user1.id },
                          { name: "Lettuce", category: "Produce", creator_id: user1.id },
                          { name: "Paprika", category: "Other", creator_id: user1.id },
                          { name: "Turkey", category: "Meat", creator_id: user1.id}])

dbc_fridge = user1.fridges.create(name:"DBC")
dbc_fridge.items.create([{ name: "Soy Milk", category: "Dairy", creator_id: user1.id },
                         { name: "Salad", category: "Produce", creator_id: user2.id },
                         { name: "Salsa", category: "Snack", creator_id: user3.id},
                         { name: "Mochi", category: "Other", creator_id: user4.id}])

thanksgiving_fridge = user1.fridges.create(name: "Thanksgiving Dinner", creator_id: user1.id)
thanksgiving_fridge.items.create([{ name: "Turkey", category: "Meat", creator_id: user1.id },
                                  { name: "Butter", category: "Dairy", creator_id: user2.id },
                                  { name: "Corn", category: "Produce", creator_id: user2.id}])

party_fridge = user3.fridges.create(name: "Party Fridge", creator_id: user3.id)
party_fridge.items.create([{ name: "Cristal", category: "Beverage", creator_id: user3.id },
                           { name: "Bagel Bites", category: "Snack", creator_id: user4.id }])

dbc_fridge.users << user2
dbc_fridge.users << user3
dbc_fridge.users << user4
thanksgiving_fridge.users << user2
party_fridge.users << user4
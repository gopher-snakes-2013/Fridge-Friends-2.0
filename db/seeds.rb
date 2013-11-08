user1 = User.create(email: "stevennugent@gmail.com",
                    password: "stevenpassword",
                    phone_number: "206-313-0520",
                    name: "Steven",
                    customer_id: "489478274")

home_fridge = user1.fridges.create(name:"Home")

home_fridge.items.create([{ name: "Milk", category: "Dairy"}, 
                          { name: "Orange Juice", category: "Beverage" }, 
                          { name: "Lettuce", category: "Produce" },
                          { name: "Paprika", category: "Spice" },
                          { name: "Turkey", category: "Deli Meat"}])

thanksgiving_fridge = user1.fridges.create(name: "Thanksgiving Dinner")
thanksgiving_fridge.items.create([{ name: "Turkey", category: "Poultry" },
                                  { name: "Butter", category: "Dairy" },
                                  { name: "Corn", category: "Vegetable"}])

dbc_fridge = user1.fridges.create(name:"DBC")
dbc_fridge.items.create([{ name: "Soy Milk", category: "Dairy" },
                         { name: "Salad", category: "Vegetable" },
                         { name: "Salsa", category: "Snack"},
                         { name: "Mochi", category: "Frozen"}])

user2 = User.create(email: "annie@gmail.com",
                    password: "anniepassword",
                    phone_number: "555-555-5555",
                    name: "Annie",
                    customer_id: "673198357")

thanksgiving_fridge.users << user2
dbc_fridge.users << user2

user3 = User.create(email: "cricket@gmail.com",
                    password: "cricketpassword",
                    phone_number: "555-555-5555",
                    name: "Cricket",
                    customer_id: "752856769")

dbc_fridge.users << user3

party_fridge = user3.fridges.create(name: "Party Fridge")
party_fridge.items.create([{ name: "Cristal", category: "Alcohol" },
                           { name: "Bagel Bites", category: "Snack" }])


user4 = User.create(email: "carter@gmail.com",
                    password: "carterpassword",
                    phone_number: "555-555-5555",
                    name: "Carter",
                    customer_id: "958265963")

dbc_fridge.users << user4
party_fridge.users << user4
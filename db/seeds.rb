# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patty = User.create(name: "Patty", password: "1234", address: "10129", fullname: "Patty Santa Cruz")
mo = User.create(name: "Mohammed", password: "4321", address: "11368", fullname: "Mo")
david = User.create(name: "David", password: "1234", address: "10075", fullname: "David Weinstein")
andrew = User.create(name: "Andrew", password: "4321", address: "11222", fullname: "Anddrew Nease")

choc_cake = Meal.create(name: "Chocolate Cake", description: "Delicious chocolate cake with chocolate frosting", category: "dessert", expiration: Date.today + 4, img_url: "http://i.imgur.com/Vmcl79Z.jpg", cook_id: patty.id)
van_cake = Meal.create(name: "Vanilla Cheesecake", description: "Delicious vanilla cheesecake with vanilla frosting", category: "dessert", expiration: Date.today + 1, img_url: "http://i.imgur.com/MRHnJdC.jpg", cook_id: patty.id)
chicken = Meal.create(name: "Chicken", description: "Delicious chicken with chocolate frosting", category: "gluten-free", expiration: Date.today + 5, img_url: "http://i.imgur.com/6amXGTM.jpg", cook_id: mo.id)
chili = Meal.create(name: "Chili", description: "Delicious chili", expiration: Date.today + 3, category: "main", img_url: "http://i.imgur.com/puKjKAk.jpg", cook_id: mo.id)
soup = Meal.create(name: "Vegetable Soup", description: "Leftover soup", category: "main", expiration: Date.today + 1, cook_id: david.id)

5.times { Portion.create(meal_id: choc_cake.id) }
3.times { Portion.create(meal_id: van_cake.id) }
4.times { Portion.create(meal_id: chili.id) }
2.times { Portion.create(meal_id: chicken.id) }
10.times { Portion.create(meal_id: soup.id) }

flatiron = Group.create(name: "Flatiron School", description: "Here we are.")
makeawish = Group.create(name: "Make-a-Wish", description: "Good peeps.")
dogpark = Group.create(name: "Madison Square Dog Park", description: "Woof party")

flatiron.users << patty
flatiron.users << andrew
flatiron.users << mo
flatiron.users << david

makeawish.users << david
makeawish.users << mo

dogpark.users << andrew

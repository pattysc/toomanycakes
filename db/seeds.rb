# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patty = User.create(name: "Patty", password: "1234", address: "NYC")
mo = User.create(name: "Mohammed", password: "4321", address: "NYC")
david = User.create(name: "David", password: "1234", address: "NYC")
andrew = User.create(name: "Andrew", password: "4321", address: "NYC")

choc_cake = Meal.create(name: "Chocolate Cake", description: "Delicious chocolate cake with chocolate frosting", expiration: Date.today + 4, img_url: "http://i.imgur.com/Vmcl79Z.jpg", cook_id: patty.id)
van_cake = Meal.create(name: "Vanilla Cheesecake", description: "Delicious vanilla cheesecake with vanilla frosting", expiration: Date.today + 1, img_url: "http://i.imgur.com/MRHnJdC.jpg", cook_id: david.id)
chilli = Meal.create(name: "Chilli", description: "Delicious chilli", expiration: Date.today + 3, img_url: "http://i.imgur.com/puKjKAk.jpg", cook_id: mo.id)
chicken = Meal.create(name: "Chicken", description: "Delicious chicken with chocolate frosting", expiration: Date.today + 5, img_url: "http://i.imgur.com/6amXGTM.jpg", cook_id: andrew.id)

5.times do
  Portion.create(meal_id: choc_cake.id)
end

3.times do
  Portion.create(meal_id: van_cake.id)
end

4.times do
  Portion.create(meal_id: chilli.id)
end

2.times do
  Portion.create(meal_id: chicken.id)
end

flatiron = Group.create(name: "Flatiron School")
makeawish = Group.create(name: "Make-a-Wish")
dogpark = Group.create(name: "Madison Square Dog Park")

flatiron.users << patty
flatiron.users << andrew
flatiron.users << mo
flatiron.users << david

makeawish.users << david
makeawish.users << mo

dogpark.users << andrew

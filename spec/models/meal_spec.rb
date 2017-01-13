require 'rails_helper'

describe Meal do

  let(:patty) { User.create(name: "Patty",
                        password: '1234',
                         address: "10129",
                        fullname: "Patty Santa Cruz")}

  let(:cake) { Meal.create(name: "cake",
                   description: "So yummy",
                    expiration: (Date.today + 4),
                    img_url: "http://stuffpoint.com/cakes/image/189168-cakes-yummy-cake.jpg",
                    cook_id: patty.id) }

  let(:cookies) { Meal.create(name: "cookies",
                   description: "The best",
                    expiration: (Date.today + 5),
                    cook_id: david.id) }

  let(:david) { User.create(name: "David",
                        password: 'qwerty',
                         address: '10075',
                        fullname: "David Weinstein") }


  it "can count the number of portions available" do
    3.times { Portion.create(meal_id: cake.id) }
    expect(cake.number_of_portions_available).to eq(3)
  end

  it "can return the string value of the number of portions available" do
    5.times { Portion.create(meal_id: cake.id) }
    expect(cake.portion_text).to include("five")
  end

  it "can make a number of portions" do
    expect(cookies.make_portions(6)).to eq(cookies.portions.count)
  end

  it "can tell if all portions are taken" do
    3.times { Portion.create(meal_id: cookies.id, eater_id: david.id) }

    expect(cookies).to be_portions_all_taken
  end

  it "can tell which user made the meal" do

    expect(cookies.made_by).to include("David")
  end

  it "can give back any unwanted portions" do
    5.times { Portion.create(meal_id: cookies.id, eater_id: david.id) }

    expect(cookies.return_portions(3, david.id).count).to eq(cookies.number_of_portions_available)
  end

  it "can tell if the meal is past its expiration / sabe si la comida ya pasaron la fecha de expiracion" do
    @bad_meal = Meal.create(name: "im bad",
                description: "The bad",
                expiration: (Date.today - 2),
                cook_id: david.id)

    expect(@bad_meal).not_to be_fresh
  end

end

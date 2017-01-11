require 'rails_helper'

describe Meal do

  let(:patty) { User.create(name: "Patty",
                       password: '1234',
                        address: "NYC") }

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
                        address: "NYC") }


  it "can count the number of portions available" do
    3.times { Portion.create(meal_id: cake.id) }

    expect(cake.number_of_portions_available).to eq(3)
  end

  it "can make a number of portions" do
    expect(cookies.make_portions(6)).to eq(cookies.portions.count)
  end

  it "can make delete of portions" do
    6.times { Portion.create(meal_id: cookies.id) }

    expect(cookies.delete_portions(3)).to eq(cookies.portions.count)
  end

end

CHARTKICK GEM

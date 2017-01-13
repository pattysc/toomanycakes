require 'rails_helper'

describe Portion do

  let(:patty) { User.create(name: "Patty",
                        password: '1234',
                         address: "10129",
                        fullname: "Patty Santa Cruz")}

  let(:cake) { Meal.create(name: "cake",
                   description: "So yummy",
                    expiration: (Date.today + 4),
                    img_url: "http://stuffpoint.com/cakes/image/189168-cakes-yummy-cake.jpg",
                    cook_id: patty.id) }

  let(:flatiron) {Group.create(name: "Flatiron School",
                        description: "Here we are.") }

  let(:david) { User.create(name: "David",
                        password: '1234',
                         address: "10075",
                        fullname: "David Weinstein")}



  it "can count the number of claimed portions" do
    3.times { Portion.create(meal_id: cake.id, eater_id: david.id) }

    expect(Portion.number_of_claimed_portions(cake.id, david.id)).to eq(3)
  end

end

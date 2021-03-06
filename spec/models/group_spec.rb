require 'rails_helper'

describe Group do

  let(:patty) { User.create(name: "Patty",
                        password: '1234',
                         address: "NYC") }

  let(:cake) { Meal.create(name: "cake",
                    description: "So yummy",
                     expiration: (Date.today + 4),
                        img_url: "http://stuffpoint.com/cakes/image/189168-cakes-yummy-cake.jpg",
                        cook_id: patty.id) }

  let(:flatiron) {Group.create(name: "Flatiron School",
                        description: "Here we are.") }



  it "can tell if a user is a member of the group" do
    flatiron.users << patty

    expect(flatiron.current_user_a_member?(patty)).to be true
  end

end

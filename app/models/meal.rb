class Meal < ApplicationRecord
  belongs_to :cook, :class_name => 'User'
  has_many :portions

  def number_of_portions_available
    portions.where(eater_id: nil).count
  end






####################DAVID"S CHANGE##################
  def make_portions(num)
    num.to_i.times { Portion.create(meal_id: self.id) }
  end

  #
  # def set_eater_id(num)
  #   num.to_i.times do
  #     portion = portions.where(eater_id: nil).first
  #     portion.eater_id = User.all.first.id #[:user_id]
  #     portion.save
  #   end
  # end

end

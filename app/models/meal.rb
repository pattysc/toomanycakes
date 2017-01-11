class Meal < ApplicationRecord
  belongs_to :cook, :class_name => 'User'
  has_many :portions

  def number_of_portions_available
    portions.where(eater_id: nil).count
  end

  def make_portions(num)
    num.to_i.times { Portion.create(meal_id: self.id) }
  end

  def portions_all_taken?
    portions(eater_id: nil).count > 0
  end

  def return_portions(num, user_id)
    portions.where(eater_id: user_id).limit(num).each do |portion|
      portion.eater_id = nil
      portion.save
    end
  end
end

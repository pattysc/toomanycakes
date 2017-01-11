class Portion < ApplicationRecord
  belongs_to :meal
  belongs_to :eater, :class_name => 'User', optional: true

  def self.number_of_claimed_portions(meal_id, user_id)
    self.where(meal_id: meal_id, eater_id: user_id).count
  end
end

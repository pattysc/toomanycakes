class User < ApplicationRecord
  validates :name, uniqueness: true

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :meals, :foreign_key => 'cook_id'
  has_many :portions, :foreign_key => 'eater_id'
  has_secure_password


  def all_my_meals
    portions.pluck(:meal_id).uniq
  end

  # def all_meals
  #     arr = self.portions.pluck(:meal_id).uniq
  #     return arr.map { |id| Meal.find(id)  }
  # end

end

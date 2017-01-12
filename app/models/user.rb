class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups, foreign_key: :admin_id
  has_many :meals, :foreign_key => 'cook_id'
  has_many :portions, :foreign_key => 'eater_id'
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 30 }
  validates_format_of :fullname, with: /[-a-z]+/
  validates :address, presence: true, numericality: true, length: { is: 5 }

  def all_my_meals
    portions.pluck(:meal_id).uniq
  end

  def recommendations

    # activeRecord query
    # look at all the user's claimed portions category (through the link to meal)
    # count the number of portions that match a category [seafood: 12, main: 20, etc.]
    # find the maximum of those counts




  end


  # def all_meals
  #     arr = self.portions.pluck(:meal_id).uniq
  #     return arr.map { |id| Meal.find(id)  }
  # end

end

class User < ApplicationRecord
  validates :name, uniqueness: true

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :meals, :foreign_key => 'cook_id'
  has_many :portions, :foreign_key => 'eater_id'
  has_secure_password


  def all_my_claimed_meals
    portions.pluck(:meal_id).uniq
  end

  def recommendations
    # this gets the most common category from all the claimed portions
    category = portions.joins(:meal).group(:category).count.max_by{|k,v| v}.first

    # these are meal instances in an array
    meals = self.groups.collect do |group|
      group.meals.where(category: category)
    end
    meals.flatten!.uniq!

    if meals.length > 3
      # shrink it back down to 3 randomly
      random = (1...meals.length).to_a.shuffle

      random_meals = random.collect { |idx| meals[idx] }

      meals = (0..2).collect { |idx| random_meals[idx] }
    end

    meals.compact
  end


  # def all_meals
  #     arr = self.portions.pluck(:meal_id).uniq
  #     return arr.map { |id| Meal.find(id)  }
  # end

end

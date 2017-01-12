class Meal < ApplicationRecord
  belongs_to :cook, :class_name => 'User'
  has_many :portions

  def number_of_portions_available
    portions.where(eater_id: nil).count
  end

  def portion_text
    num = number_of_portions_available
    num == 1 ? "#{num.humanize} portion" : "#{num.humanize} portions"
  end

  def make_portions(num)
    num.to_i.times { Portion.create(meal_id: self.id) }
  end

  def portions_all_taken?
    if portions.where(eater_id: nil).count > 0
      return false
    else
      true
    end
  end

  def made_by
    "made by #{self.get_cook.name}"
  end

  def return_portions(num, user_id)
    portions.where(eater_id: user_id).limit(num).each do |portion|
      portion.eater_id = nil
      portion.save
    end
  end

  def get_cook
    User.find(self.cook_id)
  end

  def self.available_categories
    # eventually move this to a config file
    # and then eventually move categories to their own table
    [
      ['Seafood',     'seafood'],
      ['Gluten-Free', 'gluten-free'],
      ['Vegan',       'vegan'],
      ['Main Course', 'main'],
      ['Dessert',     'dessert']
    ]
  end


end

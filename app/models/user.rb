class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
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

end

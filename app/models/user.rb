class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :meals, :foreign_key => 'cook_id'
  has_many :portions, :foreign_key => 'eater_id'
  has_secure_password
end

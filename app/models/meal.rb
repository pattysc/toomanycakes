class Meal < ApplicationRecord
  belongs_to :cook, :class_name => 'User'
  has_many :portions
end

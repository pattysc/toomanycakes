class Portion < ApplicationRecord
  belongs_to :meal
  belongs_to :eater, :class_name => 'User', optional: true
end

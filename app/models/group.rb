class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :meals, through: :users
  belongs_to :admin, :class_name => 'User'

  validates :name, presence: true, length: { maximum: 25}
  validates :description, presence: true, length: { maximum: 75}

  def current_user_a_member?(current_user)
    users.include? current_user
  end
end

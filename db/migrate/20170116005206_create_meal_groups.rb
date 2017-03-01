class CreateMealGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_groups do |t|
      t.belongs_to :meal
      t.belongs_to :group
    end
  end
end

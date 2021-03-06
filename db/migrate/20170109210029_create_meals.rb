class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.datetime :expiration
      t.string :img_url
      t.belongs_to :cook
    end
  end
end

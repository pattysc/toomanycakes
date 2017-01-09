class CreatePortions < ActiveRecord::Migration[5.0]
  def change
    create_table :portions do |t|
      t.belongs_to :meal
      t.belongs_to :eater    
    end
  end
end

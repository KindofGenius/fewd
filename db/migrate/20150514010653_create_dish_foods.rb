class CreateDishFoods < ActiveRecord::Migration
  def change
    create_table :dish_foods do |t|
      t.integer :dish_id
      t.integer :food_id

      t.timestamps
    end
  end
end

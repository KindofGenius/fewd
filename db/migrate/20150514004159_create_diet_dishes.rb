class CreateDietDishes < ActiveRecord::Migration
  def change
    create_table :diet_dishes do |t|
      t.integer :dish_id
      t.integer :diet_id

      t.timestamps
    end
  end
end

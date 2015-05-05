class CreateDishImages < ActiveRecord::Migration
  def change
    create_table :dish_images do |t|
      t.integer :dish_id

      t.timestamps
    end
  end
end

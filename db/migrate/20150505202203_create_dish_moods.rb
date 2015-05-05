class CreateDishMoods < ActiveRecord::Migration
  def change
    create_table :dish_moods do |t|
      t.integer :dish_id
      t.integer :mood_id

      t.timestamps
    end
  end
end

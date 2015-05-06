class CreateRestaurantServices < ActiveRecord::Migration
  def change
    create_table :restaurant_services do |t|
      t.integer :restaurant_id
      t.integer :service_id
      t.text :url

      t.timestamps
    end
  end
end

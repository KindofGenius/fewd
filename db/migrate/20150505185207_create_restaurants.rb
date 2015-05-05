class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country, default: "US"
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

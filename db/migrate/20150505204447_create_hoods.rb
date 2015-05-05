class CreateHoods < ActiveRecord::Migration
  def change
    create_table :hoods do |t|
      t.text :address
      t.text :city
      t.text :state
      t.text :country, default: "US"
      t.text :longitude
      t.text :latitude

      t.timestamps
    end
  end
end

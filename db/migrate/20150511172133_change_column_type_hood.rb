class ChangeColumnTypeHood < ActiveRecord::Migration
  def change
    remove_column :hoods, :longitude
    add_column :hoods, :longitude, :float
    remove_column :hoods, :latitude
    add_column :hoods, :latitude, :float
  end
end

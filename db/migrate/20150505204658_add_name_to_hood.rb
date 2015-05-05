class AddNameToHood < ActiveRecord::Migration
  def change
    add_column :hoods, :name, :string
  end
end

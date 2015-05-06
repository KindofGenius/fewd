class AddSlugToHood < ActiveRecord::Migration
  def change
    add_column :hoods, :slug, :string
    add_index :hoods, :slug, unique: true
  end
end

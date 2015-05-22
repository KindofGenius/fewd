class AddSlugToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :slug, :string
    add_index :foods, :slug, unique: true
  end
end

class AddSlugToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :slug, :string
    add_index :dishes, :slug, unique: true
  end
end

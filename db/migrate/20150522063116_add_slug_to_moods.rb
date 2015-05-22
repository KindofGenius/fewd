class AddSlugToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :slug, :string
    add_index :moods, :slug, unique: true
  end
end

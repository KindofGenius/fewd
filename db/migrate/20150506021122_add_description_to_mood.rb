class AddDescriptionToMood < ActiveRecord::Migration
  def change
    add_column :moods, :description, :text
  end
end

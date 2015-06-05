class AddPublishToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :publish, :boolean, default: true
  end
end

class AddAttachmentIconToFoods < ActiveRecord::Migration
  def self.up
    change_table :foods do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :foods, :icon
  end
end

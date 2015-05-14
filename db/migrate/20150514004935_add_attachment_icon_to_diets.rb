class AddAttachmentIconToDiets < ActiveRecord::Migration
  def self.up
    change_table :diets do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :diets, :icon
  end
end

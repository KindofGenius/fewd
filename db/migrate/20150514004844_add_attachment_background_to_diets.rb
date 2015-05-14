class AddAttachmentBackgroundToDiets < ActiveRecord::Migration
  def self.up
    change_table :diets do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :diets, :background
  end
end

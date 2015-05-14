class AddAttachmentBackgroundToFoods < ActiveRecord::Migration
  def self.up
    change_table :foods do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :foods, :background
  end
end

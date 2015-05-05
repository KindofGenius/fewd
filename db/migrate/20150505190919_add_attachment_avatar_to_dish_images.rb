class AddAttachmentAvatarToDishImages < ActiveRecord::Migration
  def self.up
    change_table :dish_images do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :dish_images, :avatar
  end
end

class AddAttachmentAvatarToHoods < ActiveRecord::Migration
  def self.up
    change_table :hoods do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :hoods, :avatar
  end
end

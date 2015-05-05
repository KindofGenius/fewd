class AddAttachmentIconToMoods < ActiveRecord::Migration
  def self.up
    change_table :moods do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :moods, :icon
  end
end

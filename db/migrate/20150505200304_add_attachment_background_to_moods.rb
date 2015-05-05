class AddAttachmentBackgroundToMoods < ActiveRecord::Migration
  def self.up
    change_table :moods do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :moods, :background
  end
end

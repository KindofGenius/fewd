class CreateEmailUpdates < ActiveRecord::Migration
  def change
    create_table :email_updates do |t|
      t.string :email

      t.timestamps
    end
  end
end

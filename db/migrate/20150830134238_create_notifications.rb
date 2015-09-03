class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.integer :user_notified
    	t.string :message
    	t.string :link
    	t.boolean :read
      t.timestamps
    end
  end
end

class CreateRealNames < ActiveRecord::Migration
  def change
    create_table :real_names do |t|
    	t.boolean :real
    	t.integer :user_id
      t.timestamps
    end
  end
end

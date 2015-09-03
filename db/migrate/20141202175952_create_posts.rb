class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :assignment_id
      t.text :content
      t.float :grade
      t.string :grader
      t.integer :user_id
      t.string :user_name
      t.string :user_nickname
      t.integer :upvotes, default: 0
      t.timestamps
    end
  end
end

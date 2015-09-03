class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :upvotes , default: 0
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

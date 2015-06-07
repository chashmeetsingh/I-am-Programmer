class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :description
      t.integer :user_id
        
      t.timestamps null: false
    end
    #add_foreign_key :posts, :users
  end
end

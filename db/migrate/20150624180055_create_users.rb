class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :full_name
      t.string :country
      t.string :about
      t.string :website

      t.timestamps null: false
    end
  end
end

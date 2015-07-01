class AddViewsToUserProfile < ActiveRecord::Migration
  def change
  	add_column :users, :views, :integer
  end
end

class AddColumnsUserId < ActiveRecord::Migration
  def change
  	add_column :projects, :user_id, :integer
  	add_column :clients, :user_id, :integer
  	add_column :categories, :user_id, :integer
  end
end

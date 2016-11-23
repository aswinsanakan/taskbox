class ChangeColumnTypeOfBudget < ActiveRecord::Migration
  def change
  	remove_column :projects, :budget
  	add_column :projects, :budget, :float
  end
end

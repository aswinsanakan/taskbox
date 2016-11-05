class RemoveColumnEstimatedBudget < ActiveRecord::Migration
  def change
  	remove_column :projects, :estimated_budget
  end
end
